# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 

Company.create(name: "Food+", category: "Food", user_id: 1)

Job.create(name: "Cashier", category: "Handling Money", description: "Handle money properly, and provide great customer service.", user_id: 1, company_id: 1)