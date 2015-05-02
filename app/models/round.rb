class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :cards, through: :deck
  has_many :guesses
  # Remember to create a migration!
end

