require 'spec_helper'

describe PostsController do

  describe "POST create" do

    it "should create a new post" do
      Post.should_receive(:new).with("title" => "How to live", "url" => "nithyarajaram.com") 
      #post :create, :post => { "title" => "How to live", "url" => "nithyarajaram.com" }
    end
    
    it "should save the new post" do
    end


end
end


