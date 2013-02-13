class ApplicationController < ActionController::Base
  protect_from_forgery


  def recommended_posts(limit=0)
    if limit == 0
      recom_posts = Post.active.promoted.to_a
    else
      recom_posts = Post.active.promoted.limit(limit).to_a
      recom_posts += Post.active.where("#{recom_posts.sql_prepared_ids}").order("id DESC").limit(limit-recom_posts.size).to_a if recom_posts.size < limit
    end

    recom_posts
  end
end
