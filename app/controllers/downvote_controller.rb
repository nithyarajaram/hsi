class DownvoteController < ApplicationController
   before_filter :authenticate_user!, :only => [:create]

  def create
    @downvote = Downvote.new(params[:downvotes])
    @downvote.downvotable_type = params[:downvotable_type]
    @downvote.downvotable_id = params[:downvotable_id]
    #@url = params[:url]
    @user = current_user

    if @downvote.downvotable_type == "Post"
      @resource = Post.find(@downvote.downvotable_id)
    else 
      @resource = Comment.find(@downvote.downvotable_id)
    end


    @downvote.user_id = @user.id
    @downvote.user_ip = @user.last_sign_in_ip
   
    # Could not find the right regex to remove the quotes from "Post"
    if @downvote.downvotable_type == "Post"
      @karma_user = Post.find(@downvote.downvotable_id).user
    else
      @karma_user = Comment.find(@downvote.downvotable_id).user
    end

    @downvote.save
    @karma_user.karma -= 1
    @karma_user.update_attribute :karma, @karma_user.karma
    @resource.save

    respond_to do |format|
      if @downvote.save
        format.json { render :json => @resource.points }
      #else
       # format.html { render @url }
      end
    end
  end

end
