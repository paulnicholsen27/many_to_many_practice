require_relative '../config/environment.rb'

puts "Instantiation:"
me = Tourist.new("Heloise")
pp =Tourist.new("Paulo")

et = Landmark.new(name:"Eiffel Tower", city: "Paris")
sf = Landmark.new(name:"La Sagrada Familia", city: "Barcelona")
mdp = Landmark.new(name:"Museo del Prado",city:"Madrid")

puts "should create a new trip for that tourist to the given landmark"
fam = me.visit_landmark(et)
fun = me.visit_landmark(sf)
friends = pp.visit_landmark(sf)
med = pp.visit_landmark(mdp)

puts "Tourist tests:"
puts "should return all of the `Tourist` instances"
puts Tourist.all == [me,pp]
puts "\n"

puts "should returns the name of the given `Tourist`"
puts me.name
puts pp.name
puts "\n"

puts "given a string of a name, returns the **first tourist** whose  name matches"
puts Tourist.find_by_name("Heloise") == me
puts Tourist.find_by_name("Paulo") == pp
puts "\n"

puts "returns an **array** of all the trips taken by the given `Tourist`"
puts me.trips == [fam,fun]
puts pp.trips == [friends,med]
puts "\n"

puts "returns an **array** of all the landmarks for the given `Tourist`"
puts me.landmarks == [et, sf]
puts pp.landmarks == [sf, mdp]
puts "\n"

puts "Landmark tests:"
puts "returns an **array** of all landmarks"
puts Landmark.all == [et,sf,mdp]
puts "\n"

puts "returns an **array** of all landmarks in that city"
puts Landmark.find_by_city("Paris") == et
puts Landmark.find_by_city("Barcelona") == sf
puts Landmark.find_by_city("Madrid") == mdp
puts "\n"

puts "returns an **array** of all the trips taken to a given landmark"
puts et.trips. == [fam]
puts sf.trips == [fun, friends]
puts mdp.trips == [med]
puts "\n"

puts "returns an **array** of all the tourists at a given landmark"
puts et.tourists == [me]
puts sf.tourists == [me,pp]
puts mdp.tourists == [pp]
puts "\n"

puts "Trip tests:"
puts "returns an array of all trips"
puts Trip.all == [fam, fun, friends, med]
puts "\n"

puts "returns the tourist who has taken that trip"
puts fam.tourist == me
puts fun.tourist == me
puts friends.tourist == pp
puts med.tourist == pp
puts "\n"

puts "returns the landmark visited on the trip"
puts fam.landmark == et
puts fun.landmark == sf
puts friends.landmark == sf
puts med.landmark == mdp
puts "\n"

puts "End of tests"


binding.pry
0
