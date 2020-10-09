# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Taking a dump"



Message.destroy_all
Registration.destroy_all
Event.destroy_all
Game.destroy_all
User.destroy_all
Gender.destroy_all

puts "Dumping completed"

# variables
genders = %w[male female transgender gender-neutral non-binary agender pangender genderqueer two-spirit third-gender all]
games = %w[scrabble connect-four cranium blokus mancala stratego catan risk pictionary othello rummikub the-game-of-life candy-land battleship trivial-pursuit cluedo monopoly backgammon checkers chess]
games_cat = %w[strategy gambling fun trivia speed]
experience = %w[Novice Intermediate Advanced Expert]
users_email = []
users_passwords = []
time_now = DateTime.now


50.times do
  users_email << Faker::Internet.email
  users_passwords << Faker::Internet.password
end

users_email.each do |email|
  puts "#{email} | #{users_passwords[users_email.index(email)]}"
end



a = "Ravnkroken 25, 1254 Oslo, Norway"
b = "Øvre Ljanskoll vei 24, 1169 Oslo, Norway"
c = "Nordstrand Terrasse 51, 1170 Oslo, Norway"
d = "Steinborgveien 49, 0678 Oslo, Norway"
e = "Sigurds gate 9, 0650 Oslo, Norway"
f = "Osterhaus' gate 14-18, 0183 Oslo, Norway"
g = "Waldemar Thranes gate 5-19, 0171 Oslo, Norway"
h = "Drammensveien 89, 0271 Oslo, Norway"
i = "Møllesvingen 22-20, 0854 Oslo, Norway"
j = "Vestgrensa 7-13, 0851 Oslo, Norway"
k = "Ivar Aasens vei 11-15, 0373 Oslo, Norway"
l = "Åsstubben 42, 0381 Oslo, Norway"
m = "Ringstabekkveien 41, 1358 Jar, Norway"
n = "Maisen Pedersens vei 38-16, 1363 Sandvika, Norway"
o = "Hiltonåsen 78-30, 1341 Slependen, Norway"
op = "Østre vei 84-94, 1397 Nesøya, Norway"
q = "Prinsessealléen 12-2, 0276 Oslo, Norway"
r = "Niels Juels gate 14A, 0272 Oslo, Norway"
s = "Henrik Ibsens gate 51-53, 0255 Oslo, Norway"
t = "Osterhaus' gate 14-18, 0183 Oslo, Norway"
u = "Nordre gate 16, 0551 Oslo, Norway"
v = "Lovisenberggata 8, 0456 Oslo, Norway"
w = "Omsens gate 14-10, 0478 Oslo, Norway"
x = "Roveruds gate 13-15, 0479 Oslo, Norway"
y = "Lindealléen 20-18, 0487 Oslo, Norway"
z = "Kildeveien 43, 0590 Oslo, Norway"

addresses = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, op, q, r, s, t, u, v, w, x, y, z]

# order of creation:
#   1- genders
puts 'creating genders'
genders.each do |gender|
  Gender.create(name: gender)
end
  # 2- users
puts 'creating 50 users'
i = 0
50.times do
  User.create(name: Faker::Name.name, email: users_email[i], password: users_passwords[0], nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.all.sample, age: (16..110).to_a.sample, address: addresses.sample)
  i = i +1
  end

User.create(name: 'Sandra Bullock', email: "sandra@live.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.all.sample, age: (16..110).to_a.sample, address: addresses.sample)



  # 3- venues
puts 'creating 15 venues'
15.times do
  Venue.create(name: Faker::Restaurant.name, address: addresses.sample, description: Faker::Restaurant.description[0..100])
end
  # 4- games
puts 'creating 20 games'
games.each do |game|
  Game.create(name: game, game_type: games_cat.sample)
end
  # 5- Events
puts 'creating 20 events'
20.times do
  Event.create(title: Faker::Marketing.buzzwords, spots: (1..7).to_a.sample, description: Faker::Lorem.sentence(word_count: 25), experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.all.sample, gender: Gender.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
end
  # 5- registrations
puts 'creating 19 registrations and messages'
events = Event.all
all_users = User.all

events.each do |event|
    organiser_id = event.user.id
    allowed_persons = []
    all_users.each do |user|
      if user.id != organiser_id
        allowed_persons << user
      end
    end
    reg = Registration.create(event: event, user: allowed_persons.sample)
  # 6- messages
    Message.create(content: "Hi everyone, I'm so excited about this next game!", event: event, user: event.user, date: time_now  )
    Message.create(content: Faker::Movies::Lebowski.quote, event: event, user: reg.user, date: (time_now + ((1..3).to_a.sample).hours).to_datetime )
  end



# making specific events and participations for Sandra
15.times do
    Event.create(title: Faker::Marketing.buzzwords, spots: (1..7).to_a.sample, description: Faker::Lorem.sentence(word_count: 25), experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.all.sample, gender: Gender.all.sample, user: User.last, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
    Registration.create(event: Event.find(4), user: User.last)
  end






