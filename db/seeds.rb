require 'faker'

category = %w(glass construction_work cycling_path)

Problem.destroy_all
User.destroy_all

# 5.times do
  user = User.create!(
    first_name: "tom",
    last_name: "lewagon",
    username: "tomlewagon",
    password: "123456",
    email: "t.klinkhamer@gmail.com"
    )

40.times do
  problem = Problem.new(
    category: category.shuffle,
    description: Faker::ChuckNorris.fact,
    location: Faker::Address.street_address,
    latitude: (52 + rand()),
    longitude: (13 + rand()),
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    user_id: User.first.id
    )
  problem.save!
end

