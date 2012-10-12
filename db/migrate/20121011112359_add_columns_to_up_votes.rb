class AddColumnsToUpVotes < ActiveRecord::Migration
  def change
    add_column :up_votes, :user_id, :integer
    add_column :up_votes, :user_ip, :string
    add_column :up_votes, :upvotable_id, :integer
    add_column :up_votes, :upvotable_type, :string
  end
end
