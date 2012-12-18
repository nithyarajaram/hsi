class HomeController < ApplicationController
  def index
   #@posts = Post.recent_posts
   @posts = Post.order(:created_at).page(params[:page]).per(5)
   if params[:page] == nil
     @count = 1
   else
    @count = (params[:page].to_i - 1) * 5 + 1
   end
  end
end
