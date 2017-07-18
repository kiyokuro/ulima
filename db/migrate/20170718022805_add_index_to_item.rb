class AddIndexToItem < ActiveRecord::Migration[5.1]
  def up
    add_index :items, [:user_id]
    add_index :items, [:created_at]
  end

  def down
    remove_index :items, [nil]
  end
end
