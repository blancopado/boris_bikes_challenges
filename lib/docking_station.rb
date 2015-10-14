require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

  def dock(bike)
    fail 'Already full' if @bike
    @bike = bike
  end
end

=begin

p station = DockingStation.new
p bike = station.release_bike
p bike.working?
p station.dock(bike)
p station.bike

=end