require 'faker'
# Faker::Demographic.race 

# Faker::Demographic.educational_attainment 

# Faker::Demographic.marital_status 

# Faker::Demographic.sex 

# Faker::Name.first_name       

# Faker::Name.last_name 

# Faker::Internet.safe_email

# Faker::Internet.password

5.times do
  params = {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email,
  password_hash: Faker::Internet.password, race: Faker::Demographic.race, educational_attainment: Faker::Demographic.educational_attainment,
  marital_status: Faker::Demographic.marital_status, sex: Faker::Demographic.sex}

  user = User.new(params)
  user.save! 
end



