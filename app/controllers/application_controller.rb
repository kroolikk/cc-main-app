class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_variables


  def prepare_variables
    @popular_tags = most_popular_tags    
  end

  def recommended_posts(limit=0)
    if limit == 0
      recom_posts = Post.active.promoted.to_a
    else
      recom_posts = Post.active.promoted.limit(limit).to_a
      recom_posts += Post.active.where("#{recom_posts.sql_prepared_ids}").order("id DESC").limit(limit-recom_posts.size).to_a if recom_posts.size < limit
    end

    recom_posts
  end


  def most_popular_tags(tags=[])
    if tags.present?
      where_cond = "WHERE "+tags.sql_prepared_ids
    else
      where_cond = ""
    end
    pop_tags = Tag.find_by_sql("SELECT t.name,
                                       ( SELECT COUNT(*)
                                         FROM taggings tg
                                         WHERE tg.tag_id = t.id ) AS counter
                                FROM tags t
                                #{where_cond}
                                ORDER BY counter DESC
                                LIMIT 20
                              ;")
  end
end
