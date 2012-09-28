class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:id])
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    redirect_to 
  end

  def index
    @comments = Comment.find(:all)
  end

  def show
    @comment = Comment.find(params[:id])
  end

end
