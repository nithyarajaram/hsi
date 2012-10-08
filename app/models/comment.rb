class Comment < ActiveRecord::Base

  
  attr_accessible :comment, :in_reply_to, :post_id, :user_id

  belongs_to :user
  
  belongs_to :post

  has_many :replies, :class_name => 'Comment',
                     :foreign_key => 'in_reply_to'
  
  belongs_to :parent_comment, :class_name => 'Comment',
                              :foreign_key => 'in_reply_to'
                            

  scope :parent_comments, :conditions => {:in_reply_to => nil}



                              
end
