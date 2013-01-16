class HomeController < ApplicationController
  include ApplicationHelper

  def index
    

    if params[:category].present?
      @promoted_posts = Post.active.promoted.where("category_id = #{cat_id_from_param(params[:category])}").order("id DESC")
      @posts = Post.active.normal.where("category_id = #{cat_id_from_param(params[:category])}").order("id DESC")
    else
      @promoted_posts = Post.active.promoted.order("id DESC")
      @posts = Post.active.normal.order("id DESC")
    end
  end
end
