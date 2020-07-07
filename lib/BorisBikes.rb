class Bike

  def working?
    false
  end

end

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise 'You have reached maximum capacity' if full?
    @docked_bikes << Bike.new
  end

  def docked_bikes
    exception_handler
    @docked_bikes
  end



  private

  def full?
    @docked_bikes.length >= @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

  def exception_handler
    raise 'You have no bikes!' if empty?
  end

end



# Create new instance of DockingStation class called docking_station
# This grants access to DockingStation class methods
#docking_station = DockingStation.new

#21.times { p docking_station.release_bike } # Manual feature test

# With the access to DockingStation methods, I can now use release_bike and assign
# this instance method value to new_bike. This instance creates new_bike new Bike instance
# (object) of the Bike class. Granting access to the Bike class methods.
#bike = docking_station.release_bike

# With the access to Bike class methods, I can now call working? method
#bike.working?

# This can also be done in one line. However, you only receive the end value.
# DockingStation.new.release_bike.working? # ADD ARGUMENTS?

# Attribute reader allows us to call the variable of an **instance** from outside the class.
#p docking_station.docked_bikes

