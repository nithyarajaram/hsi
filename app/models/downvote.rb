class Downvote < ActiveRecord::Base
  attr_accessible :downvotable_id, :downvotable_type, :user_id, :user_ip


  belongs_to :downvotable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:downvotable_id, :downvotable_type]

end
