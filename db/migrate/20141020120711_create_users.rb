class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :race
      t.string :educational_attainment
      t.string :marital_status
      t.string :sex 

      t.timestamps
    end
  end
end
