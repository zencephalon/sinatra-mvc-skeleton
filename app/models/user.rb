class User < ActiveRecord::Base
  has_secure_password
  belongs_to :company
  has_many :comments
  has_many :logs
end
