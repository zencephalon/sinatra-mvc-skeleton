class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :comment
			t.text :email
			t.references :user
			t.references :company
		end
	end
end
