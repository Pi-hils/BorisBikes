class Exception

end

class Bike

  def working?
    false
  end

end

class DockingStation
  attr_reader :capacity
  
  def initialize
    @docked_bikes = []
    @capacity = 20
  end

  def release_bike
    raise 'You have reached maximum capacity' if
        @docked_bikes.length == @capacity
    docked_bike = Bike.new
    @docked_bikes << docked_bike
    docked_bike
  end

  def docked_bikes
    raise 'You have no bikes!' if @docked_bikes.empty? || @docked_bikes.nil?
    @docked_bikes
  end

end

# Create new instance of DockingStation class called docking_station
# This grants access to DockingStation class methods
docking_station = DockingStation.new
# With the access to DockingStation methods, I can now use release_bike and assign
# this instance method value to new_bike. This instance creates new_bike new Bike instance
# (object) of the Bike class. Granting access to the Bike class methods.
bike = docking_station.release_bike

# With the access to Bike class methods, I can now call working? method
bike.working?
# This can also be done in one line. However, you only receive the end value.
DockingStation.new.release_bike.working?

# Attribute reader allows us to call the variable of an **instance** from outside the class.
docking_station.docked_bikes

#20.times { p docking_station.release_bike } # Manual feature test