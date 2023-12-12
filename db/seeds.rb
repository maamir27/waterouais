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

User.destroy_all
Station.destroy_all
Review.destroy_all

User.create!([{
  username: 'malik',
  email: 'malik@waterouais.com',
  password: 'malik321',
  password_confirmation: 'malik321'
},
{
  username: 'missmazz',
  email: 'mazz@waterouais.com',
  password: 'mazz321',
  password_confirmation: 'mazz321'
},
{
  username: 'jaden',
  email: 'jaden@waterouais.com',
  password: 'jaden321',
  password_confirmation: 'jaden321'
},
{
  username: 'richenda',
  email: 'richenda@waterouais.com',
  password: 'richenda321',
  password_confirmation: 'richenda321'
},
{
  username: 'mariam',
  email: 'mariam@waterouais.com',
  password: 'mariam321',
  password_confirmation: 'mariam321'
},
{
  username: 'shavonne83',
  email: 'shavonne@waterouais.com',
  password: 'shavonne321',
  password_confirmation: 'shavonne321'
},
{
  username: 'gabriela29',
  email: 'gabriela@waterouais.com',
  password: 'gabriela321',
  password_confirmation: 'gabriela321'
},
{
  username: 'zahraa32',
  email: 'zahra@waterouais.com',
  password: 'zahra321',
  password_confirmation: 'zahra321'
},
{
  username: 'alainah',
  email: 'alainah@waterouais.com',
  password: 'alainah321',
  password_confirmation: 'alainah321'
},
{
  username: 'mntrler',
  email: 'montreal@waterouais.com',
  password: 'montreal321',
  password_confirmation: 'montreal321'
}
])
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
  address: '2000, chemin Remembrance, Montreal, Quebec,',
  description: 'On the way up to the lookout point',
  user: User.first
})

parc_louis_riel = Station.create!({
  name: 'Louis-Riel Park',
  address: '5950 Av. de Carignan, Montréal, Quebec,',
  description: 'There is a little fountain for your dog too',
  user: User.first
})

parc_louis_reil_img = URI.open("https://res.cloudinary.com/villemontreal/image/upload/w_1200,h_1200,c_limit/f_auto,dpr_auto,q_auto/v1/portail/k2ybvsmu7dbipzsli2sh.jpg")
parc_louis_riel.photos.attach(io: parc_louis_reil_img, filename: "louis_riel.jpg", content_type: "image/jpg")
parc_louis_riel.save!

concordia = Station.create!({
  name: 'Concordia University',
  address: '1455 De Maisonneuve Blvd. W, Montreal, Quebec,',
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
  station_id: 1,
  user_id: 3
},
{
  date: DateTime.new(2023,5,25),
  rating: 1,
  description: "Was out of order...",
  station_id: 2,
  user_id: 2
},
{
  date: DateTime.new(2023,7,22),
  rating: 3,
  description: "Kind of hard to locate.",
  station_id: 5,
  user_id: 3
},
{
  date: DateTime.new(2023,2,4),
  rating: 4,
  description: "Way in the corner of the park.",
  station_id: 5,
  user_id: 3
},
{
  date: DateTime.new(2023,2,25),
  rating: 4,
  description: "Works!",
  station_id: 3,
  user_id: 5
},
{
  date: DateTime.new(2023,9,2),
  rating: 5,
  description: "Conveniently located in University Building.",
  station_id: 6,
  user_id: 4
}
])

p "#{Review.count} reviews created"
