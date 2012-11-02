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
    @upvote.save

    respond_to do |format|
      if @upvote.save
        format.json { render :json => @post.upvotes.count }
      else
        format.html { render @url }
      end
    end
  end

end 

