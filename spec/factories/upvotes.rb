# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upvote do
    user_id 1
    post_id 1
    comment_id 1
    user_ip "MyString"
  end
end
