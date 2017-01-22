require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) { double(:plane, land: nil, take_off: nil) }
  let(:plane1) { double(:plane, land: nil, take_off: nil) }
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

      expect(airport.planes).not_to include(plane)
    end

    it "should return the plane that has taken off" do
      airport.land_plane(plane)
      expect(airport.take_off(plane)).to eq(plane)
    end 
  end

    context 'raise error' do
      it "should raise an error when the plane tries to land but the weather is stormy" do
      allow(airport).to receive(:is_stormy?).and_return(true)
      expect{airport.land_plane(plane)}.to raise_error("Cannot land plane: weather is stormy")
      expect(airport.planes).not_to include(plane)
    end

      context 'raise error' do

        before do
          allow(airport).to receive(:is_stormy?).and_return(false)
        end

        it "should raise an error if th airport is full" do
          10.times {airport.land_plane(plane)}
          expect{ airport.land_plane(plane1) }.to raise_error("Cannot land plane: airport if full")
          expect(airport.planes).not_to include(plane1)
        end

        it "if a plane tries to take off but when the weather is stormy" do
          airport.land_plane(plane)
          allow(airport).to receive(:is_stormy?).and_return(true)
          expect{ airport.take_off(plane) }.to raise_error("Cannot take off: the wheather is stormy")
          expect(airport.planes).to include(plane)
        end

        it "if a plane tries to take off in an airport it is not in" do
          allow(airport2 = Airport.new).to receive(:is_stormy?).and_return(false)
          airport2.land_plane(plane)
          expect{ airport.take_off(plane) }.to raise_error("Cannot take off: plane is not in this airport")
        end
      end
    end
end
