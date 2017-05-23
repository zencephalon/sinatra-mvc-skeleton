class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :location
      t.string :temperature
      t.string :wind
      t.string :body

      t.timestamps

    end
  end
end
