class Location < ActiveRecord::Base
  # Remember to create a migration!
  validates :latitude, :longitude, :user_id, presence: true
  validates :latitude, :longitude, numericality: true
end
