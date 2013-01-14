# -*- encoding: utf-8 -*-
class FrontPostsController < ApplicationController

  def show
    @post = Post.active.where(:slug => params[:id]).first
    if @post.present?
      @photos = Photo.where("post_id = #{@post.id}").to_a
      @promoted_posts = @post.recommended(5)
    else
     Rails.logger.info "err - post not found --------------------------------------"
     render :status => 404, :layout => false, :file => "#{Rails.root}/public/404"
    end
  end

end
