# -*- encoding: utf-8 -*-
class PostsController < AdminController

  def index
    @posts = Post.select("id, 
                          slug, 
                          category_id, 
                          title, 
                          lead, 
                          start_date,
                          is_event, 
                          event_start, 
                          place_id, 
                          promoted, 
                          size, 
                          created_at").paginate(:page => params[:page], :per_page => 100)
  end


  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(params[:post])
    @post.tag_list = params[:p_tags].map{|k,v| v}.join(', ') if params[:p_tags].present?
    if @post.save
      redirect_to posts_url, notice: 'Artykuł utworzony.'
    else
      render action: "new"
    end
  end


  def update
    Rails.logger.info '==========================================='
    Rails.logger.info params[:p_tags].map{|k,v| v}.join(', ')

    @post = Post.find(params[:id])
    @post.tag_list = params[:p_tags].map{|k,v| v}.join(', ') if params[:p_tags].present?
    if @post.update_attributes(params[:post])
      redirect_to posts_url, notice: 'Artykuł wyedytowany.'
    else
      render action: "edit"
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end
