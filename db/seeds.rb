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
  languages: ["French", "English", "Mandarin"],
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

Brain.create(
  name: "Raghid",
  qi: 108,
  languages: ["French", "English"],
  specialties: ["Artist Soul", "Eloquence"],
  price_per_day: 156,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Laura",
  qi: 162,
  languages: ["French", "Mandarin"],
  specialties: ["Sporty Mindset", "Dev Profil"],
  price_per_day: 235,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Zak",
  qi: 56,
  languages: ["French", "Spanish"],
  specialties: ["Humor", "Eloquence"],
  price_per_day: 68,
  user_id: romane.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Yacine",
  qi: 112,
  languages: ["French", "English", "Spanish"],
  specialties: ["Dev Profil", "Artist Soul"],
  price_per_day: 185,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Laurent",
  qi: 123,
  languages: ["Italian", "Mandarin"],
  specialties: ["Dev Profil", "Eloquence"],
  price_per_day: 176,
  user_id: romane.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Tia",
  qi: 108,
  languages: ["French", "English", "Spanish"],
  specialties: ["Dev Profil", "Sporty Mindset"],
  price_per_day: 120,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Loana",
  qi: 124,
  languages: ["French", "Italian"],
  specialties: ["Dev Profil", "Sporty Mindset"],
  price_per_day: 188,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Lou-Anne",
  qi: 54,
  languages: ["English"],
  specialties: ["Artist Soul", "Eloquence"],
  price_per_day: 64,
  user_id: romane.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Luka",
  qi: 95,
  languages: ["French"],
  specialties: ["Dev Profil", "Sporty Mindset"],
  price_per_day: 109,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Gaulthier",
  qi: 23,
  languages: ["Mandarin"],
  specialties: ["Humor", "Artist Soul"],
  price_per_day: 45,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Maeva",
  qi: 118,
  languages: ["Italian", "English"],
  specialties: ["Humor", "Sporty Mindset"],
  price_per_day: 195,
  user_id: romane.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Amine",
  qi: 120,
  languages: ["Spanish", "Italian"],
  specialties: ["Sporty Mindset", "Eloquence"],
  price_per_day: 148,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Constance",
  qi: 83,
  languages: ["English", "Mandarin"],
  specialties: ["Dev Profil", "Humor"],
  price_per_day: 103,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Tom",
  qi: 18,
  languages: ["French"],
  specialties: ["Sporty Mindset", "Humor"],
  price_per_day: 35,
  user_id: romane.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Valentine",
  qi: 109,
  languages: ["English", "Mandarin"],
  specialties: ["Dev Profil", "Artist Soul"],
  price_per_day: 133,
  user_id: cyril.id,
  image: "brainzImage.png"
)

Brain.create(
  name: "Stephane",
  qi: 88,
  languages: ["French", "Italian"],
  specialties: ["Humor", "Eloquence"],
  price_per_day: 104,
  user_id: jeremy.id,
  image: "brainzImage.png"
)

puts "end brains"

puts "create reviews"

Review.create(
  comment: "Pas d'une grande utilité pendant les examens mais son humour m'a permis de séduire une des membres du jury et d'être finalement certifié !",
  rating: 3,
  brain_id: cyrilbrain.id
)

Review.create(
  comment: "Grâce à ses connaissances en Champagne, je suis aujourd'hui Product Manager de la Maison Moët et Chandon",
  rating: 4,
  brain_id: romanebrain.id
)

puts "end reviews"
