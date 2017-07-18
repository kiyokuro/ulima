class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :user_id, null: false
      t.text :picture, null: false
      t.index ["user_id"]

      t.timestamps
    end
  end
end
