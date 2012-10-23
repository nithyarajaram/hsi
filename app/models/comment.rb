class Comment < ActiveRecord::Base

  
  attr_accessible :comment, :in_reply_to, :post_id, :user_id

  belongs_to :user
  
  belongs_to :post

  has_many :upvotes, :as => :upvotable

  has_many :replies, :class_name => 'Comment',
                     :foreign_key => 'in_reply_to'
  
  belongs_to :parent_comment, :class_name => 'Comment',
                              :foreign_key => 'in_reply_to'
                            

  scope :parent_comments, :conditions => {:in_reply_to => nil}
  scope :recent_comments, order('created_at DESC')

  validates_presence_of :comment

  def parent_comment?
    self.in_reply_to == nil
  end

  def self.get_indentation
    indentation = 0
    if self.parent_comment?
      indentation 
    elsif Comment.find(self.in_reply_to).parent_comment?	
      indentation = indentation + 5
    else
      indentation = get_indentation(self.in_reply_to) + 5
    end
  end


                              
end
