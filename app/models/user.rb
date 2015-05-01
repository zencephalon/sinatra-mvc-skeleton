class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :round
  # Remember to create a migration!
end
