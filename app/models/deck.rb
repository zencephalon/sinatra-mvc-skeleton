class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  # Remember to create a migration!
end
