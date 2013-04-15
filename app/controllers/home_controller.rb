class HomeController < ApplicationController
  include ApplicationHelper


  def search
    sort_order = case params[:sort]
    when 'name_asc' then 'name asc'
    when 'name_desc' then 'name desc'
    when 'created_asc' then 'created_at asc'
    when 'created_desc' then 'created_at desc'
    else 'created_at desc'
    end

    @posts = Post.order(sort_order)
    if params[:keyword].present?
      params[:keyword] = params[:keyword].truncate(50)
      keywords = params[:keyword].gsub(/[=,;\"\'%\\#\{\\(\)}\$`]/, '').split(' ')
      short_keywords = keywords.select{|k| k.size <= 2}
      long_keywords = keywords.select{|k| k.size > 2}
      @short_posts = ( short_keywords.present? ? @posts.tagged_with(short_keywords, :any => true) : [] )
      @long_posts = ( long_keywords.present? ? @posts.tagged_with(long_keywords, :wild => true, :any => true) : [] )
      @posts = @short_posts + @long_posts
    end

    @posts = Kaminari.paginate_array( @posts.uniq ).page(params[:page]).per(24)
  end


  def load_more_posts
    @page = params[:page]
    @per_page = 30
    if params[:category].present?
      @posts = Post.normal.active.where("category_id = #{cat_id_from_param(params[:category])}").order("id DESC").paginate(:page => @page, :per_page => @per_page)
    else
      @posts = Post.active.normal.order("id DESC").paginate(:page => @page, :per_page => @per_page)
    end

    respond_to do |format|
      format.js
    end
  end


  def index
    @page = 1
    @per_page = 30
    if params[:category].present?
      @promoted_posts = Post.active.promoted.where("category_id = #{cat_id_from_param(params[:category])}").limit(10)
      @posts = Post.normal.active.where("category_id = #{cat_id_from_param(params[:category])}").order("id DESC").paginate(:page => @page, :per_page => @per_page)
    else
      @promoted_posts = Post.active.promoted.limit(10)
      @posts = Post.active.normal.order("id DESC").paginate(:page => @page, :per_page => @per_page)
    end
  end


  def calendar
    @years = Post.find_by_sql("SELECT DISTINCT(YEAR(event_start)) AS year FROM posts WHERE is_event = true").collect{|p| p.year}
    params[:year] = year = (params[:year] || Time.now.strftime('%Y'))
    params[:month] = month = (params[:month] || Time.now.strftime('%m'))
    day_cond, params[:week] = prepare_days_condition(params[:week])

    posts = Post.active.where("is_event = true AND YEAR(event_start) = #{year} AND MONTH(event_start) = #{month} #{day_cond}").to_a
    @grouped_posts = posts.group_by{|p| p.event_start.to_date}
  end


  def prepare_days_condition(week=nil)
    if week.present?
      case week.to_i
      when 1 then
        s = 1
        e = 8
      when 2 then
        s = 9
        e = 16
      when 3 then
        s = 17
        e = 24
      when 4 then
        s = 25
        e = 31
      end
    else
      d = Time.now.strftime('%d').to_i
      if (1..8).to_a.include?(d)
        s = 1
        e = 8
        week = 1
      elsif (9..16).to_a.include?(d)
        s = 9
        e = 16
        week = 2
      elsif (17..24).to_a.include?(d)
        s = 17
        e = 24
        week = 3
      elsif (26..31).to_a.include?(d)
        s = 25
        e = 31
        week = 4
      end
    end
    day_cond = "AND DAY(event_start) >= #{s} AND DAY(event_start) <= #{e}"
    [day_cond, week]
  end

end