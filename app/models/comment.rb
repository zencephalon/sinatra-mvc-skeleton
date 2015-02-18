class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :contract
	belongs_to :company
	end
