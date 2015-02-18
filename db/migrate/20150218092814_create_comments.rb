class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :content
			t.string :ref_type
			t.references :user
			t.references :company
			t.references :contract
		end
	end
end
