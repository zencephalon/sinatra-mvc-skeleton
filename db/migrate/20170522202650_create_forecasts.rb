class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :country, null: false
      t.string :city, null: false
      # t.string :location
      # t.datetime :date
      # t.string :temperature
      # t.string :wind
      # t.string :body

      t.timestamps
    end
  end
end
