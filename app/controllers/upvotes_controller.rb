class UpvotesController < ApplicationController

   before_filter :authenticate_user!, :only => [:create]

  def create
    @upvote = Upvote.new(params[:upvote])
    @upvote.upvotable_type = params[:upvotable_type]
    @upvote.upvotable_id = params[:upvotable_id]
    @user = current_user
    @upvote.user_id = @user.id
    @upvote.user_ip = @user.last_sign_in_ip
    @upvote.save

    respond_to do |format|
      format.html { redirect_to params[:url]}
      format.js
    end

  end 

end
