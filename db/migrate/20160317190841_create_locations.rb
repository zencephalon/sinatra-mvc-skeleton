class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 8, scale: 5
      t.decimal :longitude, precision: 8, scale: 5
      t.integer :user_id

      t.timestamps
    end
  end
end
