require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) { double(:plane) }
  let(:plane1) { double(:plane) }
  let(:weather) { double(:weather) }

  context 'not stormy' do

    before do
      allow(airport).to receive(:is_stormy?).and_return(false)
    end

    it "should return that a plane has landed in the airport" do
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it "should return that a plane has taken off and therefore no longer in the airport" do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end

    it "should not allow planes to land if the airport is full" do
      10.times {airport.land_plane(plane)}
      airport.land_plane(plane1)
      expect(airport.planes).not_to include(plane1)
    end
  end

    context '#is_stormy?' do

      before do
        airport.land_plane(plane)
        allow(airport).to receive(:is_stormy?).and_return(true)
      end

      it "should return plane still in airport when the weather is stormy" do
        airport.take_off(plane)
        expect(airport.planes).to include(plane)
      end

      it "should not allow a plane to land if stormy" do
        airport.land_plane(plane1)
        expect(airport.planes).not_to include(plane1)
      end
    end
end
