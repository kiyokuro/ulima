class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :slack_id
      t.string :password_digest
      t.string :remeber_digest
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
