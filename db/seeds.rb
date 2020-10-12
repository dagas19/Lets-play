require 'faker'
require 'open-uri'

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
game_names = %w[scrabble connect-four cranium blokus mancala stratego catan risk pictionary othello rummikub the-game-of-life candy-land battleship trivial-pursuit cluedo monopoly backgammon checkers chess]
experience = %w[Novice Intermediate Advanced Expert]
time_now = DateTime.now

p 'Creating genders.....'
genders.each do |gender|
  Gender.create(name: gender)
end

p "#{Gender.all.count} genders created!"

p 'Creating users.......'
User.create(name: 'Joanna Gaudyn', email: "joanna@lewagon.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: game_names.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 25, address: 'Smedgata 34, 0651 Oslo, NO')
User.create(name: 'Stian Johansen', email: "stian.a.johansen@gmail.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: game_names.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'male')[0], age: 38, address: 'Høyvegen 22, 7089 Trondheim, NO')
User.create(name: 'Diana Faye-Schjøll', email: "diana@diana.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: game_names.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 21, address: 'Drammensveien 54B, 0271 Oslo, NO')
User.create(name: 'Dovydas Savickas', email: "dovydas@dovydas.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: game_names.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'male')[0], age: 21, address: 'Nordstrand terrasse 15, 1170 Oslo, NO')
User.create(name: 'April Yeats', email: "april@april.com", password: "123456", nickname: Faker::DcComics.hero, preferred_games: game_names.sample((1..4).to_a.sample).join(", "), gender: Gender.where(name: 'female')[0], age: 28, address: 'Marta Steinsviks vei 14B, 1283 Oslo, NO')

p "#{User.all.count} users created!"

p 'Creating Venues'
Venue.create(name: 'Tilt', address: 'Badstugata 6, 0183 Oslo, NO', description: 'Cool concept with arcade games and drinks. Lovely employees too.')
Venue.create(name: 'Oslo Mekaniske Verksted', address: 'Tøyenbekken 34, 0188 Oslo, NO', description: 'Play games, drink and enjoy.')
Venue.create(name: 'Colonel Mustard', address: 'Darres gate 2, 0175 Oslo, NO', description: 'Great little pub on the edge of town. Board games, food, good ambiance')
Venue.create(name: 'Bar Polar', address: 'Sandakerveien 72 C, 0484 Oslo, NO', description: 'We have many cool boardgames available, good simple food and a great selection of beers')
Venue.create(name: 'Perestrojka', address: 'Storgata 13, 0155 Oslo, NO', description: 'Cool concept with arcade games and drinks. Lovely employees too.')

p "#{Venue.all.count} venues created!"

p 'Creating games....'	

# game_names.each do |game|
#   file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602502641/Shinola-Monopoly__45775.1572100948_qhaomt.jpg')
#   game1 = Game.new(name: game, game_type: games_cat.sample)
# 	game1.photo.attach(io: file, filename: 'game.png', content_type:'image/png')
# 	game1.save
# end

monopoly = Game.create(name:'monopoly', game_type: 'strategy')
chess = Game.create(name:'chess', game_type: 'strategy')
checkers = Game.create(name:'checkers', game_type: 'strategy')
scrabble = Game.create(name:'scrabble', game_type: 'trivia')
catan = Game.create(name:'catan', game_type: 'fun')
risk = Game.create(name:'risk', game_type: 'strategy')
backgammon = Game.create(name:'backgammon', game_type: 'strategy')
pictionary = Game.create(name:'pictionary', game_type: 'fun')
trivial_pursuit = Game.create(name:'trivial_pursuit', game_type: 'trivia')
stratego = Game.create(name:'stratego', game_type: 'strategy')

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602502641/Shinola-Monopoly__45775.1572100948_qhaomt.jpg')
monopoly.photo.attach(io: file, filename: 'v1602502641/Shinola-Monopoly__45775.1572100948_qhaomt.jpg', content_type:'image/png')

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602502700/89240_l200_sktnia.jpg')
chess.photo.attach(io: file, filename: 'v1602502700/89240_l200_sktnia.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602506446/play-checkers-using-standard-rules-409287_hero_2904-e5b2d879f6ad4c0d86e3df67796b55df_xbdso2.jpg')
checkers.photo.attach(io: file, filename: 'v1602506446/play-checkers-using-standard-rules-409287_hero_2904-e5b2d879f6ad4c0d86e3df67796b55df_xbdso2.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602506579/1200px-Scrabble_game_in_progress_vicufu.jpg')
scrabble.photo.attach(io: file, filename: 'v1602506579/1200px-Scrabble_game_in_progress_vicufu.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602506663/Catan1_Bg_1050x700-770x513_wyfqzj.jpg')
catan.photo.attach(io: file, filename: 'v1602506663/Catan1_Bg_1050x700-770x513_wyfqzj.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602506736/tjx_risk_deluxe_31a_zebu8d.jpg')
risk.photo.attach(io: file, filename: 'v1602506736/tjx_risk_deluxe_31a_zebu8d.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602506977/Remember-Backgammon-draufsicht-geoeffnet-freisteller_j6j6hf.jpg')
backgammon.photo.attach(io: file, filename: 'v1602506977/Remember-Backgammon-draufsicht-geoeffnet-freisteller_j6j6hf.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602507093/cc539b5be3f1f6f02ae32801ce1ae8d7_yyl3a5.jpg')
pictionary.photo.attach(io: file, filename: 'v1602507093/cc539b5be3f1f6f02ae32801ce1ae8d7_yyl3a5.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602507621/trivial-pursuit-glass-img-02_n2ajtp.jpg')
trivial_pursuit.photo.attach(io: file, filename: 'trivial-pursuit-glass-img-02_n2ajtp.jpg', content_type:'image/png')	

file = URI.open('https://res.cloudinary.com/letsplay-boardgames/image/upload/v1602507692/71BUjmB2djL._AC_SX425__xapqrl.jpg')
stratego.photo.attach(io: file, filename: 'v1602507692/71BUjmB2djL._AC_SX425__xapqrl.jpg', content_type:'image/png')	





p "#{Game.all.count} Created!"

p 'Creating events....'

Event.create(title: 'Chess night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a chess event, all genders are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: chess, venue: Venue.where(name: 'Tilt')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Board game night!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a board game night, we offer all the most popular boardgames, bring all your friends and join us for a great night out. All genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: catan, venue: Venue.where(name: 'Colonel Mustard')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Girls Monopoly bonanza!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'female')[0], description: 'Out on the town with the girls and dont know what to do? If you love board games, you should check out our Monopoly event!', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: monopoly, venue: Venue.where(name: 'Oslo Mekaniske Verksted')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Axis and allies!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'Up for an evening of strategy? Come join our Axis and allies event.', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: stratego, venue: Venue.where(name: 'Perestrojka')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Checkers night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a checkers event, all genders are welcome for a great evening', experience_level: experience.sample, min_age: (21..35).to_a.sample, max_age: (36..110).to_a.sample, game: checkers, venue: Venue.where(name: 'Bar Polar')[0], user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Board game night!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a board game night, we offer all the most popular boardgames, bring all your friends and join us for a great night out. All genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: risk, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Chess night!!', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'We are hosting a chess event, all genders and are welcome for a great evening', experience_level: experience.sample, min_age: (16..35).to_a.sample, max_age: (36..110).to_a.sample, game: chess, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
Event.create(title: 'Backgammon night for seniors', spots: (5..15).to_a.sample, gender: Gender.where(name: 'all')[0], description: 'Are you a senior and want to meet new people for a game of bridge, come join our event', experience_level: experience.sample, min_age: (60..65).to_a.sample, max_age: (66..110).to_a.sample, game: backgammon, venue: Venue.all.sample, user: User.all.sample, date: (time_now + ((6..600).to_a.sample).hours).to_datetime)
 p "#{Event.all.count} events created"
 Event.all.each { |event| p event.title }


