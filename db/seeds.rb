require 'factory_bot_rails'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Company.destroy_all
User.destroy_all

FactoryBot.create_list(:company, 15)

# TODO: My god, remember to change this
FactoryBot.create(:user, :admin, email: 'admin@gmail.com', password: 'password123')