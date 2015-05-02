class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  # Remember to create a migration!
end
