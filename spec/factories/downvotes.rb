# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :downvote do
    user_id 1
    downvotable_id 1
    downvotable_type "MyString"
    user_ip "MyString"
  end
end
