# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

# USERS
jaden_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U05FVJE3E83-fc0a168c87c5-512")
mazz_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U05FX4MEW04-08bec44f1d05-512")
malik_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U04H840LTJB-23655dd3fa99-512")

mazz = User.create!({
    username: 'mazz',
    email: 'mazz@waterouais.com',
    password: 'mazz321',
    password_confirmation: 'mazz321'
})
mazz.avatar.attach(io: mazz_avatar, filename: "mazz_avatar.jpg", content_type: "image/jpg")
mazz.save

jaden = User.create!( {
    username: 'jaden',
    email: 'jaden@waterouais.com',
    password: 'jaden321',
    password_confirmation: 'jaden321'
})
jaden.avatar.attach(io: jaden_avatar, filename: "jaden_avatar.jpeg", content_type: "image/jpeg")
jaden.save

malik = User.create!({
    username: 'malik',
    email: 'malik@waterouais.com',
    password: 'malik321',
    password_confirmation: 'malik321'
})
malik.avatar.attach(io: malik_avatar, filename: "malik_avatar.jpg", content_type: "image/jpg")
malik.save

jean_talon = Station.create!({
  name: 'Jean-Talon Market',
  address: '7070 Av Henri Julien, Montreal, Quebec',
  description: 'Turn left at the turnstiles',
  user: malik
});

westmount = Station.create!({
  name: 'Westmount Park',
  address: '327 Av. Melville, Westmount, Quebec',
  description: 'Really cool handsfree automatic water dispenser!',
  user: mazz
})


# station.photos.attach(io: img, filename: "station.jpg", content_type: "image/jpg")
# station.save
# westmount.photos.attach(io: img2, filename: "westmount.jpg", content_type: "image/jpg")
# westmount.save
