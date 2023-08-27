# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!([
  { name: Faker::Artist.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456' }
])

6.times do
  user = User.first
  Aventure.create!([
  { title: Faker::Fantasy::Tolkien.poem , description: Faker::Books::Dune.quote, 
    image: 'https://picsum.photos/200/300', user_id: user.id}])
  end