require 'faker'

puts "Cleaning database"
Problem.destroy_all
User.destroy_all
puts "Database restored"


  user = User.create!(
    first_name: "Rafael",
    last_name: "Casique",
    username: "recasique",
    password: "123456",
    email: "recasique@gmail.com"
    )

categories = Problem::CATEGORIES
100.times do
  problem = Problem.new(
    category: categories.sample,
    description: Faker::ChuckNorris.fact,
    # location: Faker::Address.street_address,
    latitude: (52.46 + 0.1*rand()),
    longitude: (13.35 + 0.1*rand()),
    date: Faker::Date.between(from: '2020-08-25', to: '2020-09-01'),
    user_id: User.first.id
    )
  problem.save!
end

# (52.49 + 0.01*rand()),
# Berlin - 52.5200° N, 13.4050° E

# brandenburg - 52.4125° N, 12.5316° E
# ostkreuz - 52.5158° N, 13.4540° E
# sudkreuz - 52.4756° N, 13.3656° E


