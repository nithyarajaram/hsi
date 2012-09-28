require 'spec_helper'

describe Post do
  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  
  describe "custom validate for url and text" do
    it "should not accept both title and url" do
      FactoryGirl.build(:post, :url => "someurl", :text => "some text").should_not be_valid
    end
  end

  describe "recent posts" do
    it "lists posts newest first" do
      @post1 = FactoryGirl.create(:post, :created_at => Time.now)
      @post2 = FactoryGirl.create(:post, :created_at => Time.now - 5)
      Post.first.should eq(@post1)
      end
    end
  describe "before save" do
    it "should sanitize url before saving" do
      @post = FactoryGirl.build(:post)
      @post.expects(:sanitize_url)
      @post.save!
    end
  end

  describe "sanitize url" do
    it "should add http to the url if it is not already there" do
      @post = FactoryGirl.create(:post, :url => "google.com")
      @post.url.should eq("http://google.com")
    end
  end
end

