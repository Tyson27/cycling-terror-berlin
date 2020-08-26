require 'faker'

category = %w(glass construction_work cycling_path)
puts "cleaning"

5.times do
  problem = Problem.new(
    category: category.shuffle,
    description: Faker::ChuckNorris.fact,
    location: Faker::Address.street_address,
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25')
    )
  problem.save!
end
puts "complete"
