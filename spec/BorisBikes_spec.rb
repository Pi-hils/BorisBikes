require 'spec_helper'
require 'BorisBikes'

describe DockingStation do
  it 'creates a new docking station' do
    expect(DockingStation.new).to respond_to(:release_bike)
  end
end

