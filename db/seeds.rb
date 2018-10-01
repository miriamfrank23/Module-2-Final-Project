# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Harry Potter", email: "hp@gmail.com")
u2 = User.create(name: "Larry Potter", email: "hp@gmail.com")
u3 = User.create(name: "Barry Potter", email: "hp@gmail.com")
u4 = User.create(name: "Scary Potter", email: "hp@gmail.com")
u5 = User.create(name: "ron Weezly", email: "heezypeezy@hogwarts.edu")
u6 = User.create(name: "Dumbledor", email: "Wizard@yahoo.com")
u7 = User.create(name: "Snape", email: "Snape@gmail.com")
u8 = User.create(name: "The Big Spider", email: "daddylonglegs@web.com")

l1 = Listing.create(name: "The Borough", price: 500, user_id: 5)
l2= Listing.create(name: "The Castle", price: 50, user_id: 4)
l3 = Listing.create(name: "NYC Penthuse", price: 1000, user_id: 6)
l4 = Listing.create(name: "Apt 5", price: 300, user_id: 7)
l5 = Listing.create(name: "The Cabinet", price: 34440000, user_id: 6)
l6 = Listing.create(name: "44 willow Ave.", price: 1500, user_id: 8)

b1 = Booking.create(user_id: 1, matched_user_id: 5, listing_id: 5)
b1 = Booking.create(user_id: 2, matched_user_id: 6, listing_id: 4)
b1 = Booking.create(user_id: 3, matched_user_id: 7, listing_id: 3)
b1 = Booking.create(user_id: 4, matched_user_id: 8, listing_id: 2)
b1 = Booking.create(user_id: 5, matched_user_id: 9, listing_id: 1)
