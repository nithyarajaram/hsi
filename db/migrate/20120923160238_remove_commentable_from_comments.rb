class RemoveCommentableFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end

  def down
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
