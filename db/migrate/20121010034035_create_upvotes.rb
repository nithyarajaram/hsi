class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.string :user_ip

      t.timestamps
    end
  end
end
