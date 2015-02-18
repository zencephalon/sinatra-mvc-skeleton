class CreateContracts < ActiveRecord::Migration
	def change
		create_table :contracts do |t|
			t.string :name
			t.string :status
			t.integer :maker_id, :references => "Company"
			t.integer :taker_id, :references => "Company"
			t.text :maker_agreement
			t.text :taker_agreement
		end
	end
end