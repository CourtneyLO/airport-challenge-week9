require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) { double(:plane) }

  context '#land plane' do
    it "should return that a plane has landed in the airport" do
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end
  end

  context '#take_off' do
    it "should return that a plane has taken off and therefore no longer in the airport" do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end
  end
end 
