class CreateContracts < ActiveRecord::Migration
	def change
		create_table :contracts do |t|
			t.string :status
			t.integer :maker, :references => "Company"
			t.integer :taker, :references => "Company"
			t.text :maker_agreement
			t.text :taker_agreement
		end
	end
end