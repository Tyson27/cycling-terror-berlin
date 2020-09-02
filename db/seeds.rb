require 'faker'


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

100.times do
category = %w(glass construction_work cycling_path)
  problem = Problem.new(
    category: category.sample,
    description: Faker::ChuckNorris.fact,
    # location: Faker::Address.street_address,
    latitude: (52.46 + 0.1*rand()),
    longitude: (13.35 + 0.1*rand()),
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    user_id: User.first.id
    )
  problem.save!
end

# (52.49 + 0.01*rand()),
# Berlin - 52.5200° N, 13.4050° E

# brandenburg - 52.4125° N, 12.5316° E
# ostkreuz - 52.5158° N, 13.4540° E
# sudkreuz - 52.4756° N, 13.3656° E


