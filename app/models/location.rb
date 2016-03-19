class Location < ActiveRecord::Base
  belongs_to :user

  validates :latitude, :longitude, :user_id, presence: true
  validates :latitude, :longitude, numericality: true
end
