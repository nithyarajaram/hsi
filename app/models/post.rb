class Post < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  belongs_to :user
  has_many :comments

  scope :recent_posts, order('created_at DESC')

   before_save :sanitize_url

    def sanitize_url
    if self.url.include?('http')
      self.url = url
    else
      self.url = "http://"+ url
    end
  end

end
