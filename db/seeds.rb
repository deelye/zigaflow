#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Customer.destroy_all if Rails.env.development?
Product.destroy_all if Rails.env.development?

puts '--- CREATING CUSTOMERS ---'

customers = Customer.create!(
    [
      { name: "Acme Inc", address: Faker::Address.full_address, email: "ceo@acmeinc.com" },
      { name: "ABC Ltd", address: Faker::Address.full_address, email: "ceo@acbltd.com" },
      { name: "AllViews Ltd", address: Faker::Address.full_address, email: "ceo@allviewsltd.com" },
      { name: "Barton Smith Ltd", address: Faker::Address.full_address, email: "ceo@bartonsmithltd.com"}
    ]
  )

puts '--- CREATING PRODUCTS ---'

products = Product.create!(
    [
      { code: "L452N", description: "Led 452N", gross: 2.50 },
      { code: "L454N", description: "Led 454N 15W", gross: 2.69 },
      { code: "PU150", description: "Power Unit 150W", gross: 4.23 },
      { code: "PU300", description: "Power Unit 300W", gross: 150.00 },
      { code: "T423", description: "Transformer 423", gross: 300.00 },
      { code: "PA344", description: "16 Switch Control Panel", gross: 580.00 }
    ]
  )

puts '--- DATABASE LOADED ---'
