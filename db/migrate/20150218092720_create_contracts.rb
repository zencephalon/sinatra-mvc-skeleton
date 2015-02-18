class CreateContracts < ActiveRecord::Migration
	def change
		create_table :contracts do |t|
			t.string :status
			t.integer :maker, references => "company"
			t.integer :taker, references => "company"
			t.text :maker_agreement
			t.text :taker_agreement
		end
	end
