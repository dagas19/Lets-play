# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# order of creation:
  # 1- genders
puts 'creating genders'
genders = %w[male female transgender gender-neutral non-binary agender pangender genderqueer two-spirit third-gender]
genders.each do |gender|
  Gender.create(name: gender)
end
  # 2- users



  # 3- venues
  # 4- games
  # 5- registrations
  # 6- messages















games = %w[scrabble connect-four cranium blokus mancala stratego catan risk pictionary othello rummikub the-game-of-life candy-land battleship trivial-pursuit cluedo monopoly backgammon checkers chess]

puts 'creating 50 users e-mails/passwords/nickname/preferred games'
50.times do
  # user = User.create!(
    puts Faker::Internet.email
    puts Faker::Internet.password
    puts Faker::DcComics.hero
    p games.sample((1..4).to_a.sample).join(", ")
  end

puts 'creating games'
puts games




puts 'creating 50 messages'
50



