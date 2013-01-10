class HomeController < ApplicationController
  def index
    @promoted_posts = Post.active.promoted

    @posts = Post.active.normal
  end
end
