class User < ActiveRecord::Base
  has_many :forecasts
  before_save { self.email = email.downcase }

  validates :username, :email, :phone_number, :encrypted_password , presence:true
  # validates :email, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :phone_number, length: { is: 10 }, numericality: {only_integer: true}


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
