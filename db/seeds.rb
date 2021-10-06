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

#Garden.destroy_all
#User.destroy_all

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

15.times do
  file = open("https://prod-saint-gobain-fr.content.saint-gobain.io/sites/saint-gobain.fr/files/2020-06/amenagement-jardin-reussi-01.jpg")
  garden = Garden.new(
    title: 'Mon annonce Jardinage',
    price: (0..1000).to_a.sample,
    description: Faker::Quotes::Shakespeare,
    address: Faker::Address.full_address,
    land: Garden::LIST_OF_LAND.sample,
    user: User.all.sample
  )
  garden.image.attach(io: file, filename: "image.jpg")
  garden.save!
end
