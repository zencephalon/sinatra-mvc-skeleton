class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :round
      t.references :card
      t.boolean :result

      t.timestamps
    end
  end
end
