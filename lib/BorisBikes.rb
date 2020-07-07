class Bike

  def working?
    false
  end

end

class DockingStation

  def release_bike
    Bike.new
  end

end


# Create new instance of DockingStation class called docking_station
# This grants access to DockingStation class methods
docking_station = DockingStation.new
# With the access to DockingStation methods, I can now use release_bike and assign
# this instance method value to new_bike. This instance creates a new Bike instance
# (object) of the Bike class. Granting access to the Bike class methods.
bike = docking_station.release_bike
# With the access to Bike class methods, I can now call working? method
bike.working?

# This can also be done in one line. However, you only receive the end value.
DockingStation.new.release_bike.working?