class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :user_id
      t.integer :downvotable_id
      t.string :downvotable_type
      t.string :user_ip

      t.timestamps
    end
  end
end
