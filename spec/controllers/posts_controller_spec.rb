require 'spec_helper'

describe PostsController do

  before :each do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user_id => @user.id)
    controller.stubs(:current_user).returns(@user)
    controller.stubs(:authenticate_user!).returns(true)
  end
  describe "creating new post" do
    render_views

    it "should redirect to home on successful save" do
      Post.any_instance.stubs(:valid?).returns(true)

      post 'create', :post => {:url => "google.com"}
      assigns[:post].should_not be_a_new_record
      flash[:notice].should be_nil
      response.should redirect_to(root_path)
    end
    
    it "re-render new template with message on failed save" do
      Post.any_instance.stubs(:valid?).returns(false)
      post 'create'
      assigns[:post].should be_a_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(new_post_path)
    end
    
    it "should pass params to post" do
      post 'create', :post => {:title => "First Post"}
      assigns[:post].title.should == "First Post"
    end
end

  describe "GET index"  do
    render_views

    it "assigns @posts" do
      get :index
      assigns(:posts).should include(@post)
    end
    
    it "should render the index template" do
    get 'index'
    response.should render_template("index")
    end
  end

  describe "Show" do
    render_views

    it "assigns the requested post to @post" do
      get :show, id: @post
      assigns[:post].should eq(@post) 
    end

    it "should render the show template" do
      get 'show', :id => 1
      response.should render_template("show")
    end
  end
end


