class AddDefaultToKarma < ActiveRecord::Migration
  def change
    change_column :users, :karma, :integer, :default => 1
  end
end
