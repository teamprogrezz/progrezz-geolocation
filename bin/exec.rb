#!/env/bin ruby

require 'progrezz/geolocation'

p1 = {latitude:  38.898556, longitude: -77.037852}
p2 = {latitude:  38.897147, longitude: -77.043934}

puts "P1: " + p1[:latitude].to_s + ", " + p1[:longitude].to_s
puts "P2: " + p2[:latitude].to_s + ", " + p2[:longitude].to_s

puts "Distancia (m):            " + Progrezz::Geolocation.distance(p1, p2, :m).to_s
puts "Distancia (km):           " + Progrezz::Geolocation.distance(p1, p2, :km).to_s
puts "Distancia (miles):        " + Progrezz::Geolocation.distance(p1, p2, :miles).to_s
puts "Distancia (nautic_miles): " + Progrezz::Geolocation.distance(p1, p2, :nautic_miles).to_s
