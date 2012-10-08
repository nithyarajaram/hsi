require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should have_many(:replies) }
  it { should belong_to(:parent_comment) }
  it { should validate_presence_of(:comment)}
end

describe "parent comments" do
  it "lists all top level comments" do
    comment = FactoryGirl.create(:comment, :in_reply_to => nil)
    comment1 = FactoryGirl.create(:comment, :in_reply_to => comment.id)
    Comment.expects(:parent_comments).returns(comment)
    assert_equal comment, Comment.parent_comments
  end

  it "does not list replies" do
    comment = FactoryGirl.create(:comment)
    comment1 = FactoryGirl.create(:comment, :in_reply_to => comment.id)
    Comment.expects(:parent_comments).returns(comment)
    assert_not_equal comment1, Comment.parent_comments
  end

end

