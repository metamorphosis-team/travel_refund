# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

csv_data = CSV.read('db/users.csv', headers: true)
csv_data.each do |data|
  User.create!(data.to_hash)
end
csv_data1 = CSV.read('db/plan.csv', headers: true)
csv_data1.each do |data|
  Plan.create!(data.to_hash)
end
csv_data2 = CSV.read('db/user-plan.csv', headers: true)
csv_data2.each do |data|
  Userplan.create!(data.to_hash)
end
