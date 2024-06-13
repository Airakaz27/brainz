# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
Review.destroy_all
User.destroy_all
Brain.destroy_all

puts "creating users..."

cyril = User.create(
  first_name: "Cyril",
  last_name: "d'Angelis",
  pseudo: "Cyssou",
  email: "cyrilleboss@gmail.com",
  password: "cyrilll"
)

jeremy = User.create(
  first_name: "Jeremy",
  last_name: "Ziani",
  pseudo: "ZiaJe",
  email: "jejedu13@hotmail.fr",
  password: "jeremy"
)

romane = User.create(
  first_name: "Romane",
  last_name: "Arvois",
  pseudo: "Roro",
  email: "romanechampagne@icloud.com",
  password: "romane"
)
puts "end users"

puts "creating brains..."

cyrilbrain = Brain.create(
  name: "Cyril",
  qi: 8,
  languages: ["French"],
  specialties: ["Humor", "Artist Soul"],
  price_per_day: 25,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Jeremy",
  qi: 180,
  languages: ["French", "English", "Spanish", "Mandarin"],
  specialties: ["Dev Profil", "Eloquence"],
  price_per_day: 307,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

romanebrain = Brain.create(
  name: "Romane",
  qi: 92,
  languages: ["English", "Mandarin"],
  specialties: ["Sporty Mindset", "Eloquence"],
  price_per_day: 103,
  user_id: romane.id,
  image: "brainzImage.png"
)
puts "end brains"

puts "create reviews"

Review.create(
  comment: "Pas d'une grande utilité pendant les examens mais son humour m'a permis de séduire une des membres du jury",
  rating: 1,
  brain_id: cyrilbrain.id
)

Review.create(
  comment: "Grâce à ses connaissances en Champagne, je suis aujourd'hui Product Manager de la Maison Moët et Chandon",
  rating: 2,
  brain_id: romanebrain.id
)

puts "end reviews"
