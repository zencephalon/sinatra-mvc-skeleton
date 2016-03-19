10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email,
    password: 'password')

  2.times do
    Location.create(user_id: user.id,
                    latitude: (rand * 90 * [-1, 1].sample).round(5),
                    longitude: (rand * 180 * [-1, 1].sample).round(5))

  end
end
