class UpvotesController < ApplicationController

   before_filter :authenticate_user!, :only => [:create]

  def create
    @upvote = Upvote.new(params[:upvotes])
    @upvote.upvotable_type = params[:upvotable_type]
    @upvote.upvotable_id = params[:upvotable_id]
    @url = params[:url]
    @post = Post.find(@upvote.upvotable_id)
    @user = current_user
    @upvote.user_id = @user.id
    @upvote.user_ip = @user.last_sign_in_ip
   
    # Could not find the right regex to remove the quotes from "Comment"
    if params[:upvotabe_type] == "Comment"
      @karma_user = Comment.find(@upvote.upvotable_id).user
    else
      @karma_user = Post.find(params[:upvotable_id]).user
    end

    @upvote.save
    @karma_user.karma += 1
    @karma_user.save

    respond_to do |format|
      if @upvote.save
        format.json { render :json => @post.upvotes.count }
      else
        format.html { render @url }
      end
    end
  end

end 

