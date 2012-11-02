class RemovingDefaultForKarma < ActiveRecord::Migration
  def up
    change_column_default(:users, :karma, nil)
  end

  def down
  end
end
