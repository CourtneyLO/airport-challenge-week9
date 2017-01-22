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
end 
