class HomeController < ApplicationController
  def index
   @posts = Post.recent_posts 
  end
end
