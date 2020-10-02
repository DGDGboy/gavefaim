# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"


puts "Cleaning database..."

Restaurant.destroy_all
Review.destroy_all
User.destroy_all


puts "Creating User..."
jerome = User.create!(name: "Jérôme", password: "29082020", email: "toulouse.jerome@gmail.com")
emilie = User.create!(name: "Emilie", password: "29082020", email: "emilie.lws@gmail.com")
gavefaim = User.Create!(name: "Emilie et Jérôme", password: "29082020", email: "gavefaim@gmail.com")
puts "User created ✅"

puts "Adding photo to Users..."
photo = URI.open("https://res.cloudinary.com/dyxvuottl/image/upload/v1601387217/s0rajfkgbc37rym8897s4bb4jd24.jpg")
emilie.photo.attach(io: photo, filename: 'photo.jpeg', content_type: 'image/jpeg')
emilie.save!



photo = URI.open("https://res.cloudinary.com/dyxvuottl/image/upload/v1601387219/cu71gw24mvpalybr8beq11dj7nq6.jpg")
jerome.photo.attach(io: photo, filename: 'photo.jpeg', content_type: 'image/jpeg')
jerome.save!
puts "Users' photo added ✅"

puts "Creating restaurants..."
racines = Restaurant.create(name: "Chez Racines", description: "Nous avons passé un moment incroyable", rating: 8, address: "59 Rue Georges Bonnac, 33000 Bordeaux", style: "semi gastronomique", user: jerome)
symbiose = Restaurant.create(name: "Le Symbiose", description: "Pour nous, notre meilleure adresse bordelaise",rating: 9, address: "4 Quai des Chartrons, 33000 Bordeaux", style: "semi gastronomique", user: emilie)
cyusha = Restaurant.create(name: "Le C'yusha", description: "Une découverte fabuleuse,...",rating: 9, address: "12 Rue Ausone, 33000 Bordeaux", style: "gastronomique", user: emilie)
puts "Restaurants created 🍲"


puts "Adding photos to restaurants..."
photo1 = URI.open("https://res.cloudinary.com/dyxvuottl/image/upload/v1601228926/fhqzjvo5ldjbvzy3bjvc.jpg")
racines.images.attach(io: photo1, filename: 'photo.jpeg', content_type: 'image/jpg')
racines.save!

photo2 = URI.open("https://res.cloudinary.com/dyxvuottl/image/upload/v1601228942/mkqat8458tlq5t3r9guj.jpg")
symbiose.images.attach(io: photo2, filename: 'photo.jpeg', content_type: 'image/jpg')
symbiose.save!

photo3 = URI.open("https://res.cloudinary.com/dyxvuottl/image/upload/v1601228955/fxjd7m5gvaxzq9bekmwc.png")
cyusha.images.attach(io: photo3, filename: 'photo.jpeg', content_type: 'image/png')
cyusha.save!
puts "Restaurants' photos added ✅"
puts "Finished! 🍟"
