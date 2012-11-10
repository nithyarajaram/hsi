class UpvotesController < ApplicationController

   before_filter :authenticate_user!, :only => [:create]

  def create
    @upvote = Upvote.new(params[:upvotes])
    @upvote.upvotable_type = params[:upvotable_type]
    @upvote.upvotable_id = params[:upvotable_id]
    #@url = params[:url]
    @user = current_user

    if @upvote.upvotable_type == "Post"
      @resource = Post.find(@upvote.upvotable_id)
    else 
      @resource = Comment.find(@upvote.upvotable_id)
    end


    @upvote.user_id = @user.id
    @upvote.user_ip = @user.last_sign_in_ip
   
    # Could not find the right regex to remove the quotes from "Post"
    if @upvote.upvotable_type == "Post"
      @karma_user = Post.find(@upvote.upvotable_id).user
    else
      @karma_user = Comment.find(@upvote.upvotable_id).user
    end

    @upvote.save
    @karma_user.karma += 1
    @karma_user.update_attribute :karma, @karma_user.karma
    @resource.save

    respond_to do |format|
      if @upvote.save
        format.json { render :json => @resource.points }
      #else
       # format.html { render @url }
      end
    end
  end

end 

