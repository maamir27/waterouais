# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
#   puts "Processing #{file.split('/').last}"
#   require file
# end
require "open-uri"

Review.destroy_all
User.destroy_all
Station.destroy_all
Review.destroy_all

malik = User.create!({
  username: 'maamir',
  email: 'malik@waterouais.com',
  password: 'malik321',
  password_confirmation: 'malik321'
})
malik.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/malik.jpeg"), filename: "malik.jpeg")
malik.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 1853)
malik.save!

missmazz = User.create!({
  username: 'missmazz',
  email: 'mazz@waterouais.com',
  password: 'mazz321',
  password_confirmation: 'mazz321'
  })

missmazz.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/mazz.jpeg"), filename: "mazz.jpeg")
missmazz.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 1300)
missmazz.save!

jaden = User.create!({
  username: 'jaden',
  email: 'jaden@waterouais.com',
  password: 'jaden321',
  password_confirmation: 'jaden321'
})
jaden.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/jaden.png"), filename: "jaden.png")
jaden.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 1460)
jaden.save!

richenda = User.create!({
  username: 'richenda',
  email: 'richenda@waterouais.com',
  password: 'richenda321',
  password_confirmation: 'richenda321'
})
richenda.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/richenda.jpeg"), filename: "richenda.jpeg")
richenda.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 700)
richenda.save!

danny = User.create!({
  username: 'drdanny',
  email: 'danny@waterouais.com',
  password: 'danny321',
  password_confirmation: 'danny321'
  })
danny.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/danny.png"), filename: "danny.png")
danny.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 1340)
danny.save!

shavonne1 = User.create!({
  username: 'shamama',
  email: 'shavonne@waterouais.com',
  password: 'shavonne321',
  password_confirmation: 'shavonne321'
})
shavonne1.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/shavonne.png"), filename: "shavonne.png")
shavonne1.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 464)
shavonne1.save!

nadia = User.create!({
  username: 'nadiaa',
  email: 'nadia@waterouais.com',
  password: 'nadia321',
  password_confirmation: 'nadia321'
})
nadia.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/nadia.png"), filename: "nadia.png")
nadia.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 990)
nadia.save!

fred95 = User.create!({
  username: 'fred95',
  email: 'fred@waterouais.com',
  password: 'fred321',
  password_confirmation: 'fred321'
})
fred95.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/fred.png"), filename: "fred.png")
fred95.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 670)
fred95.save!

alainah = User.create!({
  username: 'alainah',
  email: 'alainah@waterouais.com',
  password: 'alainah321',
  password_confirmation: 'alainah321'
})
alainah.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/alainah.jpg"), filename: "alainah.jpg")
alainah.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 800)
alainah.save!

mntrler = User.create!({
  username: 'mntrler',
  email: 'montreal@waterouais.com',
  password: 'montreal321',
  password_confirmation: 'montreal321'
})
mntrler.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 950)
mntrler.save!

sofia = User.create!({
  username: 'Sofia',
  email: 'sofia@waterouais.com',
  password: 'sofia321',
  password_confirmation: 'sofia321'
})
sofia_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U020VNWMRSN-68a250703b8f-512")
sofia.avatar.attach(io: sofia_avatar, filename: "sofia_avatar.jpeg", content_type:"image/jpeg")
sofia.create_score(check_in: 0, stations_created: 0, reviews_submitted: 0, photos_added: 0, total_score: 1000)
sofia.save!

p "Adding #{User.count} users."

jean_talon_market = Station.create!({
  name: 'Jean-Talon Market',
  address: '7070 Henri-Julien Avenue, Montréal, Québec H2S 3S3',
  description: "Once you're inside the market, turn left at the turnstiles.",
  user: User.last
})
jean_talon = URI.open("https://www.bridgeandtunnelclub.com/bigmap/outoftown/canada/quebec/montreal/marchejean-talon/3802-15-10.jpg")
jean_talon_market.photos.attach(io: jean_talon, filename: "jeantalon.jpg", content_type:"image/jpg")
jean_talon_market.save!

westmount_station = Station.create!({
  name: 'Westmount Park',
  address: '327 Av. Melville, Westmount, Quebec',
  description: 'Really cool handsfree automatic water dispenser!',
  user: User.first
  })
westmount = URI.open("https://westmount.org/wp-content/uploads/2020/07/waterdispenser-800x445.jpg")
westmount_station.photos.attach(io: westmount, filename: "westmount.jpg", content_type: "image/jpg")
westmount_station.save!

parc_delorme = Station.create!({
  name: 'Delorme Park',
  address: 'Parc Delorme',
  description: 'An elegant water fountain at Delorme Park, adorned with artistic motifs, provides a refreshing source for visitors',
  user: User.first
  })
delorme = URI.open("https://ir.4sqi.net/img/general/original/34318217_aYUh4nUGfDdNmLCjSrJrx_IbQJAHQu1ZU8iQYosjRa0.jpg")
parc_delorme.photos.attach(io: delorme, filename: "westmount.jpg", content_type: "image/jpg")
parc_delorme.save!


parc_sir_wilfried = Station.create!({
  name: 'Sir-Wilfried-Laurier Park',
  address: 'Parc Sir-Wilfrid-Laurier',
  description: 'An elegant water fountain at Parc Sir-Wilfrid-Laurier',
  user: User.first
  })
sir_wilfried = URI.open("https://upload.wikimedia.org/wikipedia/commons/0/0a/Allee_Parc_Laurier.JPG")
parc_sir_wilfried.photos.attach(io: sir_wilfried, filename: "westmount.jpg", content_type: "image/jpg")
parc_sir_wilfried.save!


parc_pelican = Station.create!({
  name: 'Pelican Park',
  address: "Parc du Pelican, Montreal",
  description: 'A modern water fountain graces Pelican Park, featuring contemporary design elements and providing a refreshing oasis for park-goers to enjoy.',
  user: User.third
  })
pelican = URI.open("https://media.lavitrine.com/image/1503588230240.jpg?format=w600h400")
parc_pelican.photos.attach(io: pelican, filename: "westmount.jpg", content_type: "image/jpg")
parc_pelican.save!

parc_maisonneuve = Station.create!({
  name: 'Maisonneuve Park',
  address: "4601 R. Sherbrooke E, Montréal",
  description: 'A modern water fountain graces Maisoneuve Park',
  user: User.last
  })
maisonneuve = URI.open("https://lh3.googleusercontent.com/p/AF1QipNXhIxEhtIPrrajeKiKLw_C85YdwdP2EmEsxD7L=s1360-w1360-h1020")
parc_maisonneuve.photos.attach(io: maisonneuve, filename: "westmount.jpg", content_type: "image/jpg")
parc_maisonneuve.save!

parc_joseph_pare = Station.create!({
  name: 'Joseph Paré Park',
  address: "Parc Joseph-Paré",
  description: 'Joseph-Paré Park boasts a charming water fountain, seamlessly blending aesthetic appeal with functionality.',
  user: User.second
  })
joseph_pare = URI.open("https://lh3.googleusercontent.com/p/AF1QipP4vjxAKpmb51AIps_G4xvloYk6Yz2U4XUGgEVz=s1360-w1360-h1020")
parc_joseph_pare.photos.attach(io: joseph_pare, filename: "westmount.jpg", content_type: "image/jpg")
parc_joseph_pare.save!

parc_lafond = Station.create!({
  name: 'Lafond Park',
  address: "3330 Avenue Laurier, Montreal",
  description: 'At Lafond Park, a picturesque water fountain stands as a focal point, harmonizing beauty and practicality. ',
  user: User.last
  })
lafond = URI.open("https://lh3.googleusercontent.com/p/AF1QipP4vjxAKpmb51AIps_G4xvloYk6Yz2U4XUGgEVz=s1360-w1360-h1020")
parc_lafond.photos.attach(io: lafond, filename: "westmount.jpg", content_type: "image/jpg")
parc_lafond.save!

parc_molson = Station.create!({
  name: 'Molson Park',
  address: "6496 Rue D'Iberville, Montreal",
  description: 'At Molson Park.',
  user: User.last
  })
molson = URI.open("https://imtl.org/image/big/3_MG_0826.jpg")
parc_molson.photos.attach(io: molson, filename: "westmount.jpg", content_type: "image/jpg")
parc_molson.save!

place_hector = Station.create!({
  name: "Place Hector-Prud'homme",
  address: "Rue de Bellechasse, Montréal",
  description: "Discover tranquility at Place Hector-Prud'homme with the allure of a water fountain.",
  user: User.second
  })
hector = URI.open("https://changetaville.files.wordpress.com/2017/03/place-hector-prudhomme.jpg?w=665&resize=665%2C347&h=347")
place_hector.photos.attach(io: hector, filename: "westmount.jpg", content_type: "image/jpg")
place_hector.save!

avenue_shamrock = Station.create!({
  name: "Shamrock Avenue",
  address: "Rue de Bellechasse, Montréal",
  description: "This captivating feature combines artistic flair with a refreshing purpose, beckoning visitors to pause and enjoy a moment of calm amidst the park's natural surroundings.",
  user: User.second
  })
shamrock = URI.open("https://lh5.googleusercontent.com/p/AF1QipP-vGoaRfCCY479alT4DsO7_ClamdNcjSMt6pxL=w408-h306-k-no")
avenue_shamrock.photos.attach(io: shamrock, filename: "westmount.jpg", content_type: "image/jpg")
avenue_shamrock.save!

parc_beaubien = Station.create!({
  name: "Beaubien Park",
  address: "6633, 6e Avenue Montreal",
  description: "Enhance your experience at Beaubien Park with the soothing presence of a water fountain.",
  user: User.first
  })
beaubien = URI.open("https://imtl.org/image/big/1_MG_5612.jpg")
parc_beaubien.photos.attach(io: beaubien, filename: "westmount.jpg", content_type: "image/jpg")
parc_beaubien.save!

sport_park_pere_marquette = Station.create!({
  name: "Pere Narquette Sport Park",
  address: "6633, 6e Avenue Montreal",
  description: "At Sport Park Pere Marquette, a dynamic water fountain takes center stage.",
  user: User.second
  })
pere_marquette = URI.open("https://res.cloudinary.com/villemontreal/image/upload/v1668805945/portail/e6ycbxa7dskdtuj8potx.jpg")
sport_park_pere_marquette.photos.attach(io: pere_marquette, filename: "westmount.jpg", content_type: "image/jpg")
sport_park_pere_marquette.save!

sport_park_claude_robillard = Station.create!({
  name: "Claude Robillard Sports Complex",
  address: "1000 Av. Émile-Journault, Montréal, QC H2M 2E7",
  description: "At Sport Park Pere Marquette, a dynamic water fountain takes center stage.",
  user: User.third
  })
claude_robillard = URI.open("https://ville.montreal.qc.ca/memoiresdesmontrealais/sites/default/files/80136856.jpg")
sport_park_claude_robillard.photos.attach(io: claude_robillard, filename: "westmount.jpg", content_type: "image/jpg")
sport_park_claude_robillard.save!

parc_st_laurent = Station.create!({
  name: "Saint Laurent Park",
  address: "Parc Saint-Laurent, Montreal",
  description: "At Sport Park Pere Marquette, a dynamic water fountain takes center stage.",
  user: User.second
  })
st_laurent = URI.open("https://ville.montreal.qc.ca/memoiresdesmontrealais/sites/default/files/80136856.jpg")
parc_st_laurent.photos.attach(io: st_laurent, filename: "westmount.jpg", content_type: "image/jpg")
parc_st_laurent.save!

parc_gohier = Station.create!({
  name: "Gohier Park",
  address: "Parc Gohier, Montreal",
  description: "At Gohier Park, an inviting water fountain graces the landscape with practical allure.",
  user: User.last
  })
gohier = URI.open("https://ville.montreal.qc.ca/memoiresdesmontrealais/sites/default/files/80136856.jpg")
parc_gohier.photos.attach(io: gohier, filename: "westmount.jpg", content_type: "image/jpg")
parc_gohier.save!

parc_kindersley = Station.create!({
  name: "Kindersley Park",
  address: "Park Kindersley, Mount Royal, Quebec",
  description: "At kindersley Park, an accessible water fountain.",
  user: User.third
  })
kindersley = URI.open("https://strollerparking.ca/wp-content/uploads/2019/09/0Q7A6880-1024x683.jpg")
parc_kindersley.photos.attach(io: kindersley, filename: "westmount.jpg", content_type: "image/jpg")
parc_kindersley.save!

parc_st_gabriel = Station.create!({
  name: 'Parc Saint-Gabriel',
  address: '2355 Rue Mullins, Montréal, Quebec',
  description: 'Not too far from Charlevoix metro.',
  user: User.first
})
parc_st_gabriel_photo = URI.open("https://lh5.googleusercontent.com/p/AF1QipNMvWCaBEM9Wj6tmYGtmyL75C4Rmzd2CVWw7fuE=s1127-k-no")
parc_st_gabriel.photos.attach(io: parc_st_gabriel_photo, filename: "st_gabriel.jpg", content_type: "image/jpg")
parc_st_gabriel.save!

mt_royal_park = Station.create!({
  name: 'Parc du Mont-Royal',
  address: '2000, chemin Remembrance',
  description: 'On the way up to the lookout point',
  user: User.first
})
mt_royal_park.photos.attach(io: File.open("#{Rails.root}/app/assets/images/parc_mt_royal.jpeg"), filename: "mtroyal.jpeg")
mt_royal_park.save!

parc_louis_riel = Station.create!({
  name: 'Louis-Riel Park',
  address: '5950 Av. de Carignan',
  description: 'There is a little fountain for your dog too',
  user: User.last
})

parc_louis_reil_img = URI.open("https://res.cloudinary.com/villemontreal/image/upload/w_1200,h_1200,c_limit/f_auto,dpr_auto,q_auto/v1/portail/k2ybvsmu7dbipzsli2sh.jpg")
parc_louis_riel.photos.attach(io: parc_louis_reil_img, filename: "louis_riel.jpg", content_type: "image/jpg")
parc_louis_riel.save!

concordia = Station.create!({
  name: 'Concordia University',
  address: '1455 De Maisonneuve Blvd. W',
  description: 'Works great!',
  user: User.first
})

concordia_img = URI.open("https://www.concordia.ca/cunews/main/stories/2013/04/15/an-oasis-of-drinking-water-on-campus/_jcr_content/images/image_jpg_1.img.jpg")
concordia.photos.attach(io: concordia_img, filename: "concordia.jpg", content_type: "image/jpg")
concordia.save!

p "Creating stations and adding to map..."

Review.create!([{
  date: DateTime.new(2023,11,27),
  rating: 5,
  description: 'Very close to the market, which is a bonus.',
  station: jean_talon_market,
  user: jaden
},
{
  date: DateTime.new(2023,5,25),
  rating: 1,
  description: "Was out of order...",
  station: westmount_station,
  user: missmazz
},
{
  date: DateTime.new(2023,7,22),
  rating: 3,
  description: "Kind of hard to locate.",
  station: westmount_station,
  user: malik
},
{
  date: DateTime.new(2023,2,4),
  rating: 4,
  description: "Way in the corner of the park.",
  station: parc_st_gabriel,
  user: jaden
},
{
  date: DateTime.new(2023,2,25),
  rating: 4,
  description: "Works!",
  station: parc_st_gabriel,
  user: nadia
},
{
  date: DateTime.new(2023,9,2),
  rating: 5,
  description: "Conveniently located in University Building.",
  station: westmount_station,
  user: richenda
},
{
  date: DateTime.new(2022,10,3),
  rating: 1,
  description: "Hate it here...",
  station: westmount_station,
  user: shavonne1
},
{
  date: DateTime.new(2023,9,2),
  rating: 4,
  description: "Cute picnic spot!",
  station: parc_maisonneuve,
  user: malik
},
{
  date: DateTime.new(2023,7,13),
  rating: 2,
  description: "Wasn't very clean..",
  station: parc_lafond,
  user: shavonne1
},
{
  date: DateTime.new(2023,8,10),
  rating: 4,
  description: "Love this park, and the station is very centrally located!",
  station: parc_beaubien,
  user: richenda
},
{
  date: DateTime.new(2023,2,7),
  rating: 2,
  description: "not working",
  station: parc_sir_wilfried,
  user: danny
}
])

p "#{Review.count} reviews created"
