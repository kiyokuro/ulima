class ChengeColumnForegnkeyTo < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :user_id
    add_column :pictures, :item_id, :integer
  end
end
