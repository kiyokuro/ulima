class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false, default: 1
      t.boolean :show_enable, null: false, default: true
      t.integer :like_count, null: false, default: 0

      t.timestamps
    end
  end
end
