class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :country, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
