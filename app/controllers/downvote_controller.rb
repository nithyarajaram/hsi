class DownvoteController < ApplicationController
   before_filter :authenticate_user!, :only => [:create]

  def create
    @downvote = Downvote.new(params[:downvotes])
    @downvote.downvotable_type = params[:downvotable_type]
    @downvote.downvotable_id = params[:downvotable_id]
    #@url = params[:url]
    @user = current_user
    @downvote.user_id = @user.id
    @downvote.user_ip = @user.last_sign_in_ip
    @downvote.save

    if @downvote.downvotable_type == "Post"
      @resource = Post.find(@downvote.downvotable_id)
      @karma_user = Post.find(@resource).user
    else 
      @resource = Comment.find(@downvote.downvotable_id)
      @karma_user = Comment.find(@resource).user
    end
   
    @karma_user.karma -= 1
    @karma_user.update_attribute :karma, @karma_user.karma
    @resource.save
    
      if @karma_user.karma <= 4
        @karma_user.update_attribute :admin, false
      else
        @karma_user.update_attribute :admin, true
      end


    respond_to do |format|
      if @downvote.save
        format.json { render :json => @resource.points }
      #else
       # format.html { render @url }
      end
    end
  end

end
