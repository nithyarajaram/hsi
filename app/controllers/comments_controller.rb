class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    #@comment.post_id = @post.id
    @comment.save

    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def index
    @comments = Comment.all
    @comment.user = current_user
    respond_to do |format|
      format.html
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.user = current_user
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end
end
