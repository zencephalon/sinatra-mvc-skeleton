class Card < ActiveRecord::Base
  belongs_to :deck
  # Remember to create a migration!
end
