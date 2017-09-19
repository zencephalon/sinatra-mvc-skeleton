require 'faker'

5.times do
  params = {username: Faker::Internet.user_name, email: Faker::Internet.safe_email,
  encrypted_password: Faker::Internet.password, race: Faker::Demographic.race, educational_attainment: Faker::Demographic.educational_attainment,
  marital_status: Faker::Demographic.marital_status, sex: Faker::Demographic.sex}

  user = User.new(params)
  user.save!
end



