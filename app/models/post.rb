class Post < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  belongs_to :user
  has_many :comments

  scope :recent_posts, order('created_at DESC')
end
