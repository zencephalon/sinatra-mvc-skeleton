class User < ActiveRecord::Base
  has_many :forecasts

  validates :username, :email, :encrypted_password , presence:true
  validates :email, uniqueness: true


  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate?(plain_text_password)
    self.password == plain_text_password
  end

end
