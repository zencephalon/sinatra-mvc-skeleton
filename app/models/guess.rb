class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round
  belongs_to :user, through: :round
  # Remember to create a migration!
end
