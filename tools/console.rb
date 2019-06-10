require_relative '../config/environment.rb'




louvre = Gallery.new("Louvre", "Paris, France")
moma = Gallery.new("MoMA", "New York City, NY")
third = Gallery.new("Special Third Gallery", "Unknown, USA")

van_gogh = Artist.new("Van Gogh", 20)
monet = Artist.new("Monet", 15)
relm = Artist.new("Relm", 5)

m1 = monet.create_painting("The Lunch", 8888)
m2 = monet.create_painting("Waterlilies", 888)

m1.gallery = louvre
m2.gallery = moma

v1 = van_gogh.create_painting("Sunflowers", 777)
v2 = van_gogh.create_painting("The Potato Eaters", 700)

v1.gallery = louvre
v2.gallery = third

r1 = relm.create_painting("Ultros", 1994)
r2 = relm.create_painting("Lakshmi", 999)

r1.gallery = louvre
r2.gallery = third






binding.pry

puts "Bob Ross rules."


