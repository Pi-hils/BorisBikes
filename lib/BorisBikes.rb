class Bike

  def working?
    @working = [true, false].sample
  end

end

class DockingStation
  attr_reader :capacity, :returned_bike, :docked_bikes, :released_bike
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike # Bikes released TO the docking station
    raise 'You have reached maximum capacity' if full?
    report_broken(@released_bike) unless (@released_bike = Bike.new.working?)
    @docked_bikes << @released_bike
  end

  def bike_release # Bikes released to a member of the public
    exception_handler
    @docked_bikes.sample ? 'Enjoy the bike' : 'Sorry, the bike is broken!'
  end

  def report_broken(broken_bike)
    'Broken bike!'
    false
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
docking_station = DockingStation.new

#19.times { p docking_station.release_bike } # Manual feature test

# With the access to DockingStation methods, I can now use release_bike and assign
# this instance method value to new_bike. This instance creates new_bike new Bike instance
# (object) of the Bike class. Granting access to the Bike class methods.
p release_bike = docking_station.release_bike

# With the access to Bike class methods, I can now call working? method
p bike_release = docking_station.bike_release

# This can also be done in one line. However, you only receive the end value.
# DockingStation.new.release_bike.working? # ADD ARGUMENTS?

# Attribute reader allows us to call the variable of an **instance** from outside the class.
#p docking_station.docked_bikes

