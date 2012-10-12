class RemoveColumnsFromUpvotes < ActiveRecord::Migration
  def up
    remove_column :upvotes, :post_id
    remove_column :upvotes, :comment_id
  end

  def down
    add_column :upvotes, :post_id, :integer
    add_column :upvotes, :comment_id, :integer
  end
end
