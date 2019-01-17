class Tourist
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|tourist| tourist.name == name}
  end

  def trips
    Trip.all.select {|trip| trip.tourist  == self}
  end

  def landmarks
    trips.collect {|trip| trip.landmark}.uniq
  end

  def visit_landmark(landmark)
    Trip.new(tourist: self,landmark: landmark)
  end
end
