class Upvote < ActiveRecord::Base

  attr_accessible :upvotable_id, :upvotable_type, :user_id, :user_ip

  belongs_to :upvotable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:upvotable_id, :upvotable_type]

end
