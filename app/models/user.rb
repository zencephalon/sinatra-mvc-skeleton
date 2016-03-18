class User < ActiveRecord::Base
  # Remember to create a migration!
  #validations, then return to users.rb line 24
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, :email, :encrypted_password, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :name, :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

end
