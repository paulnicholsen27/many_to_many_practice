class Landmark
  attr_reader :name, :city
  @@all = []

  def initialize(name:, city:)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_city(city)
    self.all.find {|landmark| landmark.city == city}
  end

  def trips
    Trip.all.select {|trip| trip.landmark  == self}
  end

  def tourists
    trips.collect {|trip| trip.tourist}.uniq
  end
end
