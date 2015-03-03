require 'progrezz/geolocation'

p1 = {latitude:  0.5, longitude: 3.0}
p2 = {latitude:  0.51, longitude: 3.0}

puts "P1: " + p1[:latitude].to_s + ", " + p1[:longitude].to_s
puts "P2: " + p2[:latitude].to_s + ", " + p2[:longitude].to_s

puts "Distancia (m):            " + Progrezz::Geolocation.distance(p1, p2, :m).to_s
puts "Distancia (km):           " + Progrezz::Geolocation.distance(p1, p2, :km).to_s
puts "Distancia (miles):        " + Progrezz::Geolocation.distance(p1, p2, :miles).to_s
puts "Distancia (nautic_miles): " + Progrezz::Geolocation.distance(p1, p2, :nautic_miles).to_s
