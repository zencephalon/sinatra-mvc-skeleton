class Round < ActiveRecord::Base
  has_many :guesses
  has_many :cards, through: :guess
  belongs_to :user
  belongs_to :deck
  # Remember to create a migration!
end

