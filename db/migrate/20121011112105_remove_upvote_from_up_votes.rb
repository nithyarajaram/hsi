class RemoveUpvoteFromUpVotes < ActiveRecord::Migration
  def up
    remove_column :up_votes, :upvote
  end

  def down
    add_column :up_votes, :upvote, :integer
  end
end
