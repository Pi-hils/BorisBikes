require 'spec_helper'
require 'BorisBikes'

describe DockingStation do
  it 'creates a new docking station' do
    expect(DockingStation.new).to respond_to(:release_bike)
  end
  it 'creates a new docking station with a non-default capacity' do
    expect(DockingStation.new(30)).to respond_to(:release_bike)
    expect(DockingStation.new(30).capacity).to eq(30)
  end
  it 'docks a bike' do
    expect(DockingStation.new.release_bike.class).to eq(Array)
  end
  it 'checks for a bike' do
    t1 = DockingStation.new
    t1.release_bike
    expect(t1.docked_bikes).to respond_to(:length)
  end
end

describe DockingStation do
  it 'should not provide bikes before releasing a bike' do
    expect { DockingStation.new.bike_release }.to raise_error(RuntimeError)
  end
  it 'should not allow docking when station is over capacity' do
    expect do
      t1 = DockingStation.new
      (t1.capacity + 1).times { t1.release_bike }
    end.to raise_error(RuntimeError)
  end
  it 'should not raise an error under capacity' do
    expect {
      t1 = DockingStation.new
      (t1.capacity).times { t1.release_bike }
    }.to_not raise_error
  end
end

describe DockingStation, 'Report Broken' do
  t2 = DockingStation.new
  t2.release_bike
  it { expect(t2.released_bike).to be(true).or be(false) }
end
