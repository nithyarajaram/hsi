require 'spec_helper'

describe CommentsController do
 before :each do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.create(:comment, :user_id => @user.id, :post_id => @post.id)
    controller.stubs(:current_user).returns(@user)
    controller.stubs(:authenticate_user!).returns(true)
  end
  describe "creating new comment" do
    render_views

    it "should redirect to the same post on successful save" do
      Comment.any_instance.stubs(:valid?).returns(true)

      post 'create', :comment => { :post_id => @post.id }
      assigns[:comment].should_not be_a_new_record
      flash[:notice].should be_nil
      response.should redirect_to(post_path(@post))
    end
    
    it "re-render post with message on failed save" do
      Comment.any_instance.stubs(:valid?).returns(false)
      post 'create', :comment => { :post_id => @post.id }
      assigns[:comment].should be_a_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(post_path(@post))
    end
    
    it "should pass params to comment" do
      post 'create', :comment => {:comment => "Some comment", :post_id => @post.id}
      assigns[:comment].comment.should == "Some comment"
    end
end

 
    end


end
