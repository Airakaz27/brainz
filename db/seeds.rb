# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "creating users..."

cyril = User.create!(
  first_name: "Cyril",
  last_name: "d'Angelis",
  pseudo: "Cyssou",
  email: "cyrilleboss@gmail.com",
  password: "cyril"
)

jeremy = User.create!(
  first_name: "Jeremy",
  last_name: "Ziani",
  pseudo: "ZiaJe",
  email: "jejedu13@hotmail.fr",
  password: "jeremy"
)

romane = User.create!(
  first_name: "Romane",
  last_name: "Arvois",
  pseudo: "Roro",
  email: "romanechampagne@icloud.com",
  password: "romane"
)
puts "end users"

puts "creating brains..."

Brain.create!(
  name: "Cyril",
  qi: 8,
  languages: ["Français"],
  specialties: ["Humor", "Artist Soul"],
  price_per_day: 25,
  user_id: cyril.id,
  image:
)
puts "end brains"
