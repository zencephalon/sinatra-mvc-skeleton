class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.integer :phone_number, limit: 8
      t.string :encrypted_password, null: false

      t.timestamps
    end
  end
end
