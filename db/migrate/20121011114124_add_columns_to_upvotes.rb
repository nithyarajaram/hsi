class AddColumnsToUpvotes < ActiveRecord::Migration
  def change
    add_column :upvotes, :upvotable_id, :integer
    add_column :upvotes, :upvotable_type, :string
  end
end
