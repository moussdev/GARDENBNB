# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Respect des validations

require 'faker'

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
  garden = Garden.new(
    title: 'Mon annonce Jardinage',
    price: (0..1000).to_a.sample,
    image: Faker::LoremFlickr.image(size: "50x60"),
    description: Faker::Quotes::Shakespeare,
    address: Faker::Address.full_address,
    land: Garden::LIST_OF_LAND.sample,
    user: User.all.sample
  )
  garden.save!
end