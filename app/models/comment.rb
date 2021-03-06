class Comment < ActiveRecord::Base

  attr_accessible :comment, :in_reply_to, :post_id, :user_id

  belongs_to :user
  
  belongs_to :post

  has_many :upvotes, :as => :upvotable

  has_many :downvotes, :as => :downvotable

  has_many :replies, :class_name => 'Comment',
                     :foreign_key => 'in_reply_to'
  
  belongs_to :parent_comment, :class_name => 'Comment',
                              :foreign_key => 'in_reply_to'

  scope :parent_comments, :conditions => {:in_reply_to => nil}
  scope :recent_comments, order('created_at DESC')

  before_save :set_points

  validates_presence_of :comment

  def parent_comment?
    self.in_reply_to == nil
  end

  def set_points
    self.points = self.upvotes.count - self.downvotes.count
  end
  
end
