class Comment < ActiveRecord::Base
  
  attr_accessible :comment, :in_reply_to

  belongs_to :user
  
  belongs_to :post

  has_many :replies, :class_name => 'Comment',
                     :foreign_key => 'in_reply_to'
  
  belongs_to :parent_comment, :class_name => 'Comment'
                              
end
