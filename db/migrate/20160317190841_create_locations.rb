class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 12, scale: 10
      t.decimal :longitude, precision: 12, scale: 10
      t.integer :user_id

      t.timestamps
    end
  end
end
