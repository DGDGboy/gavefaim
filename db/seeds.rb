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


puts "Creating Admins..."
jerome = User.create!(name: "Jérôme", password: "29082020", email: "toulouse.jerome@gmail.com", superadmin_role: true)
emilie = User.create!(name: "Emilie", password: "29082020", email: "emilie.lws@gmail.com", superadmin_role: true)
gavefaim = User.create!(name: "Emilie et Jérôme", password: "29082020",  email: "gavefaim@gmail.com", superadmin_role: true)
puts "Admins created ✅"

puts "Creating User..."
james = User.create!(name: "James", password: "29082020", email: "james@gmail.com", user_role: true)
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
racines = Restaurant.create(name: "Chez Racines", title: "Un Chef en or!", description: "Nous avons passé un moment incroyable", descriptionDeux: "", rating: 8, address: "59 Rue Georges Bonnac, 33000 Bordeaux", style: "semi gastronomique", user: jerome)
symbiose = Restaurant.create(name: "Le Symbiose", title: "Des légumes oubliés!",description: "Pour nous, notre meilleure adresse bordelaise", descriptionDeux: "", rating: 9, address: "4 Quai des Chartrons, 33000 Bordeaux", style: "semi gastronomique", user: emilie)
cyusha = Restaurant.create(name: "Le C'yusha", title: "L'histoire d'une famille!",description: "Une découverte fabuleuse,...", descriptionDeux: "", rating: 9, address: "12 Rue Ausone, 33000 Bordeaux", style: "gastronomique", user: emilie)
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
