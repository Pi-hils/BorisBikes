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

docking_station = DockingStation.new
new_bike = docking_station.release_bike
p new_bike.working?