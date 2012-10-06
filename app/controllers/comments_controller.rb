class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@comment.post)
    end
  

  def index
    @comments = Comment.all
    #@comment.user = current_user
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.user = current_user
  end

  def new_reply
  @parent_comment = Comment.find(params[:id])
  @reply = Comment.new(:in_reply_to => @parent_comment.id, :post_id => @parent_comment.post_id)
  
  end

  def create_reply
    @reply = Comment.new(params[:reply])
    @parent_comment = Comment.find(params[:in_reply_to])
    @post = @parent_comment.post
    @reply.post_id = @post.id
    if @reply.save
      flash[:notice] = "Reply posted"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if current_user.id == @comment.user_id  
      @comment.destroy
      redirect_to post_path(@post)
    else
      flash[:notice] = "You don't have permission to delete"
      redirect_to post_path(@post)
    end
  end

  def replies
    @comment = Comment.find(params[:id])
    @replies = @comment.replies
  end

   
end
  

