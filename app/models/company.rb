class Company < ActiveRecord::Base
	has_many :users
	has_many :logs
	has_many :comments
	has_many :contracts
end
