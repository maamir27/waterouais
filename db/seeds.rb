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
  username: 'jogmontreal',
  email: 'montreal@waterouais.com',
  password: 'montreal321',
  password_confirmation: 'montreal321'
},
{
  username: 'mrdrip',
  email: 'mrdrip@waterouais.com',
  password: 'mrdrip321',
  password_confirmation: 'mrdrip321'
},
{
  username: 'pawspal',
  email: 'pawspal@waterouais.com',
  password: 'paws321',
  password_confirmation: 'paws321'
}
])
p "Created #{User.count} users."

jean_talon_market = Station.create!({
  name: 'Jean-Talon Market',
  address: '7070 Henri-Julien Avenue, Montréal, Québec H2S 3S3',
  description: "Once you're inside the market, turn left at the turnstiles.",
  user: User.last
})
jean_talon = URI.open("https://www.bridgeandtunnelclub.com/bigmap/outoftown/canada/quebec/montreal/marchejean-talon/3802-15-10.jpg")
jean_talon_market.photos.attach(io: jean_talon, filename: "jeantalon.jpg", content_type:"image/jpg")
jean_talon_market.save!
p "Created Jean Talon Market Station"

westmount_station = Station.create!({
  name: 'Westmount Park',
  address: '327 Av. Melville, Westmount, Quebec',
  description: 'Really cool handsfree automatic water dispenser!',
  user: User.first
  })
westmount = URI.open("https://westmount.org/wp-content/uploads/2020/07/waterdispenser-800x445.jpg")
westmount_station.photos.attach(io: westmount, filename: "westmount.jpg", content_type: "image/jpg")
westmount_station.save!
p "Created Westmount Park Station"

parc_st_gabriel = Station.create!({
  name: 'Parc Saint-Gabriel',
  address: '2355 Rue Mullins, Montréal, Quebec',
  description: 'Not too far from Charlevoix metro.',
  user: User.first
})

parc_st_gabriel_photo = URI.open("https://lh5.googleusercontent.com/p/AF1QipNMvWCaBEM9Wj6tmYGtmyL75C4Rmzd2CVWw7fuE=s1127-k-no")
parc_st_gabriel.photos.attach(io: parc_st_gabriel_photo, filename: "st_gabriel.jpg", content_type: "image/jpg")
parc_st_gabriel.save!
p "Created St-Gabriel Park Station"

mt_royal_park = Station.create!({
  name: 'Parc du Mont-Royal',
  address: '2000, chemin Remembrance, Montreal, Quebec,',
  description: 'On the way up to the lookout point',
  user: User.first
})
p "Created Parc du Mont-Royal Station"

parc_louis_riel = Station.create!({
  name: 'Louis-Riel Park',
  address: '5950 Av. de Carignan, Montréal, Quebec,',
  description: 'There is a little fountain for your dog too',
  user: User.first
})

parc_louis_reil_img = URI.open("https://res.cloudinary.com/villemontreal/image/upload/w_1200,h_1200,c_limit/f_auto,dpr_auto,q_auto/v1/portail/k2ybvsmu7dbipzsli2sh.jpg")
parc_louis_riel.photos.attach(io: parc_louis_reil_img, filename: "louis_riel.jpg", content_type: "image/jpg")
parc_louis_riel.save!
