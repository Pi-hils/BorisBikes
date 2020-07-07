require 'spec_helper'
require 'BorisBikes'

describe DockingStation do
  it 'creates a new docking station' do
    expect(DockingStation.new).to respond_to(:release_bike)
  end
  it 'docks a bike' do
    expect(DockingStation.new.release_bike.class).to eq(Bike)
  end
  it 'checks for a bike' do
    t1 = DockingStation.new
    t1.release_bike
    expect(t1.docked_bikes).to respond_to(:length)
  end
end

describe DockingStation do
  it 'should not provide bikes before releasing a bike' do
    expect { DockingStation.new.docked_bikes }.to raise_error(RuntimeError)
  end
  it 'should not allow docking when station is full' do
    t1 = DockingStation.new
    t1.release_bike
    expect { t1.release_bike }.to raise_error(RuntimeError)
  end

end

