class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.integer :user_id

      t.timestamps(null: false)
    end
  end
end
