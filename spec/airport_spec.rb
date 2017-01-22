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
  end

    context 'raise error' do
      it "should raise an error when the plane tries to land but the weather is stormy" do
      allow(airport).to receive(:is_stormy?).and_return(true)
      expect{airport.land_plane(plane)}.to raise_error("Cannot land plane: weather is stormy")
      expect(airport.planes).not_to include(plane)
    end

      it "should raise an error if th airport is full" do
        allow(airport).to receive(:is_stormy?).and_return(false)
        10.times {airport.land_plane(plane)}
        expect{ airport.land_plane(plane1) }.to raise_error("Cannot land plane: airport if full")
        expect(airport.planes).not_to include(plane1)
      end

      it "if a plane tries to take off but when the weather is stormy" do
        allow(airport).to receive(:is_stormy?).and_return(false)
        airport.land_plane(plane)
        allow(airport).to receive(:is_stormy?).and_return(true)
        expect{ airport.take_off(plane) }.to raise_error("Cannot take off: the wheather is stormy")
        expect(airport.planes).to include(plane)
      end
  end
end
