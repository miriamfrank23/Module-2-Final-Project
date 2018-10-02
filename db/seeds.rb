
u1 = User.create(name: "Harry Potter", email: "hp@gmail.com")
u2 = User.create(name: "Larry Potter", email: "hp@gmail.com")
u3 = User.create(name: "Barry Potter", email: "hp@gmail.com")
u4 = User.create(name: "Scary Potter", email: "hp@gmail.com")
u5 = User.create(name: "ron Weezly", email: "heezypeezy@hogwarts.edu")
u6 = User.create(name: "Dumbledor", email: "Wizard@yahoo.com")
u7 = User.create(name: "Snape", email: "Snape@gmail.com")
u8 = User.create(name: "The Big Spider", email: "daddylonglegs@web.com")

l1 = Listing.create(name: "The Borough", price: 500, user_id: 5, address: "591 Avenue B", city: "New York", state: "NY", rating: 3.85)
l2= Listing.create(name: "The Castle", price: 50, user_id: 4, address: "1550 Willowshade Lane", city: "Cincinatti", state: "OH", rating: 4.15)
l3 = Listing.create(name: "NYC Penthuse", price: 1000, user_id: 6, address: "11 Winding Way", city: "Los Angeles", state: "CA", rating: 4.85)

l6 = Listing.create(name: "Near Best Hiking Trails.", price: 1500, user_id: 8, address: "101 Mountain Rd.", city: "Oaklington", state: "MA", rating: 2.85)

l11 = Listing.create(name: "The Best Place Ever", price: 1929, user_id: 2, address: "151 Ranger Blvd", city: "Sandy Hook", state: "CT", rating: 4.85)
l12= Listing.create(name: "Super Cozy Patio", price: 250, user_id: 8, address: "15 Army Hose Lane", city: "Jersey City", state: "NJ", rating: 5)
l13 = Listing.create(name: "Beautiful Marina View", price: 10000, user_id: 7, address: "11 Winding Way", city: "Miami", state: "FL", rating: 4.85)

l14 = Listing.create(name: "Crazy Quad Trails", price: 300, user_id: 4, address: "15 Harpoon St.", city: "New York", state: "NY", rating: 5)

l15 = Listing.create(name: "Right By Sky Mall", price: 34440000, user_id: 6, address: "95 Alvin St.", city: "New York", state: "NY", rating: 4 )

l16 = Listing.create(name: "Hang Out With A Great View of the City.", price: 12500, user_id: 8, address: "101 4th Ave.", city: "New York", state: "NY", rating: 3.85)

l111 = Listing.create(name: "The Deli by sears", price: 500, user_id: 5, address: "591 Madison Avenue", city: "New York", state: "NY", rating: 3.85)

l112= Listing.create(name: "Desert Paradise", price: 50, user_id: 4, address: "1550 Pacedina Way", city: "Palm Springs", state: "CA", rating: 1.15)

l113 = Listing.create(name: "NYC At Its Worst", price: 1000, user_id: 6, address: "5 7th St.", city: "New York", state: "NY", rating: 2.85)


l220 = Listing.create(name: "Super Waves Ahead.", price: 1503800, user_id: 8, address: "2088 Beach Cove Rd.", city: "Maui", state: "HI", rating: 5)

l200 = Listing.create(name: "Open Apt for All of Sept!", price: 1000, user_id: 6, address: "58 124th St.", city: "New York", state: "NY", rating: 4.25)
l210 = Listing.create(name: "Empire State Building and Rooftop Views!!", price: 10928, user_id: 2, address: "50 Empire State St.", city: "New York", state: "NY", rating: 4.15)
l2100 = Listing.create(name: "Close to Subways", price: 1000, user_id: 4, address: "37th St. Apt 5D", city: "New York", state: "NY", rating: 3.85)
l230 = Listing.create(name: "Cozy Loft for Two!", price: 1000, user_id: 6, address: "1224 7th Ave.", city: "New York", state: "NY", rating: 1.85)
l240 = Listing.create(name: "Right Near Central Park", price: 533000, user_id: 4, address: "12 Park Ave.", city: "New York", state: "NY", rating: 4.85)
l250 = Listing.create(name: "Great Apt For Rent, Near Statue of Liberty", price: 1000, user_id: 1, address: "5 7th St.", city: "New York", state: "NY", rating: 2.85)


x00 = Listing.create(name: "2 Story Open Apt for All of Dec!", price: 10200, user_id: 5, address: "899 124th St.", city: "New York", state: "NY", rating: 4.25)
x10 = Listing.create(name: "Rooftop Apt!!", price: 10928, user_id: 2, address: "122 W. 4th St.", city: "New York", state: "NY", rating: 5)

b1 = Booking.create(user_id: 1, matched_user_id: 5, listing_id: 5)
b1 = Booking.create(user_id: 2, matched_user_id: 6, listing_id: 4)
b1 = Booking.create(user_id: 3, matched_user_id: 7, listing_id: 3)
b1 = Booking.create(user_id: 4, matched_user_id: 8, listing_id: 2)
b1 = Booking.create(user_id: 5, matched_user_id: 9, listing_id: 1)
