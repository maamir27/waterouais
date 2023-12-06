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

img = URI.open("https://imtl.org/image/big/1_MG_0539.jpg")
img2 = URI.open("https://westmount.org/wp-content/uploads/2020/07/waterdispenser-800x445.jpg")

user = User.create!({
    username: 'maamir',
    email: 'water@waterouais.com',
    password: 'waterisw3t',
    password_confirmation: 'waterisw3t'
})

station = Station.create!({
  name: 'Jean Talon Market',
  address: '7070 Av Henri Julien, Montreal, Quebec',
  description: 'Turn left at the turnstiles',
  user: user
});

westmount = Station.create!({
  name: 'Westmount Park',
  address: '327 Av. Melville, Westmount, Quebec',
  description: 'Really cool handsfree automatic water dispenser!',
  user: user
})

station.photos.attach(io: img, filename: "station.jpg", content_type: "image/jpg")
station.save
westmount.photos.attach(io: img2, filename: "westmount.jpg", content_type: "image/jpg")
westmount.save
