class CreateLogs < ActiveRecord::Migration
	def change
		create_table :logs do |t|
			t.string :action
			t.references :company
			t.references :contract
			t.references :user
			t.references :comment
		end
	end
end
