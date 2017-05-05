class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :race
      t.string :educational_attainment
      t.string :marital_status
      t.string :sex

      t.timestamps
    end
  end
end
