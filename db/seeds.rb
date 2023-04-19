# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

35.times do
  create(:company, :with_comments)
end

15.times do 
  create(:company)
end

# TODO: My god, remember to change this
create(:user, :admin, email: 'admin@gmail.com', password: 'password123')