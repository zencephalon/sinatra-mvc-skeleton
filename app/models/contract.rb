class Contract < ActiveRecord::Base
	belongs_to :maker, :class_name => 'Company'
	belongs_to :taker, :class_name => 'Company'
	has_many :users
	has_many :logs
	has_many :comments
end
