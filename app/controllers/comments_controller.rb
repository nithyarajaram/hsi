class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      flash[:notice] = "Something went wrong. Please try again"
      redirect_to post_path(@comment.post)
    end
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.user = current_user
  end

  def new_reply
  @parent_comment = Comment.find(params[:id])
  @reply = Comment.new(:in_reply_to => @parent_comment.id, :post_id => @parent_comment.post_id)
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
if false
  def get_indentation(comment, indentation = 0)
    if comment.in_reply_to.empty?
      indentation
    elsif Comment.find(comment.in_reply_to).parent_comment?	
      indentation = indentation + 5
    else
      indentation = get_indentation(Comment.find(comment.in_reply_to)) + 5
    end
  end
end

end
  

