require 'faker'

p 'Taking a dump.......'



Message.destroy_all
Registration.destroy_all
Event.destroy_all
Game.destroy_all
User.destroy_all
Gender.destroy_all
Venue.destroy_all

p 'Dumping completed!'

games_cat = %w[strategy gambling fun trivia speed]
genders = %w[male female transgender gender-neutral non-binary agender pangender genderqueer two-spirit third-gender all]
games = %w[scrabble connect-four cranium blokus mancala stratego catan risk pictionary othello rummikub the-game-of-life candy-land battleship trivial-pursuit cluedo monopoly backgammon checkers chess]
experience = %w[Novice Intermediate Advanced Expert]
time_now = DateTime.now

p 'Creating genders.....'
genders.each do |gender|
  Gender.create(name: gender)
end

p "#{Gender.all.count} genders created!"

p 'Creating users.......'
User.create(name: 'Joanna Gaudyn', email: "joanna@lewagon.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 25, address: 'Smedgata 34, 0651 Oslo, NO')
User.create(name: 'Stian Johansen', email: "stian.a.johansen@gmail.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'male')[0], age: 38, address: 'Høyvegen 22, 7089 Trondheim, NO')
User.create(name: 'Diana Faye-Schjøll', email: "diana@diana.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 21, address: 'Drammensveien 54B, 0271 Oslo, NO')
User.create(name: 'Dovydas Savickas', email: "dovydas@dovydas.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'male')[0], age: 21, address: 'Nordstrand terrasse 15, 1170 Oslo, NO')
User.create(name: 'April Yeats', email: "april@april.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: games.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 28, address: 'Marta Steinsviks vei 14B, 1283 Oslo, NO')

p "#{User.all.count} users created!"

p 'Creating Venues'
Venue.create(name: 'Tilt', address: 'Badstugata 6, 0183 Oslo, NO', description: 'Cool concept with arcade games and drinks. Lovely employees too.')
Venue.create(name: 'Oslo Mekaniske Verksted', address: 'Tøyenbekken 34, 0188 Oslo, NO', description: 'Play games, drink and enjoy.')
Venue.create(name: 'Colonel Mustard', address: 'Darres gate 2, 0175 Oslo, NO', description: 'Great little pub on the edge of town. Board games, food, good ambiance')
Venue.create(name: 'Bar Polar', address: 'Sandakerveien 72 C, 0484 Oslo, NO', description: 'We have many cool boardgames available, good simple food and a great selection of beers')
Venue.create(name: 'Perestrojka', address: 'Storgata 13, 0155 Oslo, NO', description: 'Cool concept with arcade games and drinks. Lovely employees too.')

p "#{Venue.all.count} venues created!"

p 'Creating games....'
games.each do |game|
  Game.create(name: game, game_type: games_cat.sample)
end

p "#{Game.all.count} Created!"

p 'Creating events....'

Event.create(title: 'Chess night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a chess event, all genders are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.where(name: 'Tilt')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Board game night!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a board game night, we offer all the most popular boardgames, bring all your friends and join us for a great night out. All genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.where(name: 'Colonel Mustard')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Girls Monopoly bonanza!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'female')[0], description: 'Out on the town with the girls and dont know what to do? If you love board games, you should check out our Monopoly event!', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.where(name: 'Oslo Mekaniske Verksted')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Axis and allies!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'Up for an evening of strategy? Come join our Axis and allies event.', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.where(name: 'Perestrojka')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Checkers night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a checkers event, all genders are welcome for a great evening', experience_level: experience.sample, min_age: (21..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.where(name: 'Bar Polar')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Board game night!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a board game night, we offer all the most popular boardgames, bring all your friends and join us for a great night out. All genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Chess night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a chess event, all genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: Game.all.sample, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Bridge night for seniors', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'Are you a senior and want to meet new people for a game of bridge, come join our event', experience_level: experience.sample, min_age: (60..65).to_a.sample, max_age: (66..110).to_a.sample, game: Game.all.sample, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
 p "#{Event.all.count} events created"
 Event.all.each { |event| p event.title }



p "Creating registrations....Stian please don't be a tawt and don't delete these registrations"
Registration.create(event: Event.find(1), user: User.first)
Registration.create(event: Event.find(2), user: User.first)
Registration.create(event: Event.find(3), user: User.first)
Registration.create(event: Event.find(4), user: User.first)
Registration.create(event: Event.find(5), user: User.first)
Registration.create(event: Event.find(6), user: User.first)


