50.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email,
    password: 'password')
end

50.times do
  Location.create(user_id: rand(User.all.size),
                  latitude: (rand * 90 * [-1, 1].sample).round(5),
                  longitude: (rand * 180 * [-1, 1].sample).round(5))
end
