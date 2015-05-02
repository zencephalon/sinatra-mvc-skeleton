class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :round
  # Remember to create a migration!
  def self.authenticate(name, password)
    if
      !User.find_by(name: name, password: password)
      "Thats not a valid name"
      return 'deny'
    end
  end
end
