# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Respect des validations

require 'faker'
require 'open-uri'

Reservation.destroy_all
Garden.destroy_all
User.destroy_all


15.times do
  user = User.new(
    username: Faker::Name.middle_name,
    password: 'icicestparis',
    email: Faker::Internet.email,
    image: Faker::Avatar.image(slug: "my-own-slug"),
    description: Faker::Quotes::Shakespeare,
    address: Faker::Address.full_address,
    phonenumber: Faker::PhoneNumber.cell_phone
  )
  user.save!
end

garden_names = ["Mon jardin", "Mon petit jardinou", "Mon petit coin de paradis", "Funny garden"]

15.times do
  file = open("https://source.unsplash.com/collection/80920194")
  garden = Garden.new(
    title: garden_names.sample,
    price: (0..1000).to_a.sample,
    description: Faker::Quotes::Shakespeare,
    address: Faker::Address.full_address,
    land: Garden::LIST_OF_LAND.sample,
    user: User.all.sample
  )
  garden.image.attach(io: file, filename: "image.jpg")
  garden.save!
end
