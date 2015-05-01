class Deck < ActiveRecord::Base
  has_many :cards
  # Remember to create a migration!
end
