class AddColumsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :in_reply_to, :integer
  end
end
