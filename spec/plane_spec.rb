require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  let(:airport) { double(:airport) }

  context "raise error" do
    it "if an in_airport plane tries to land" do
      plane.land(airport)
      expect{ plane.land(airport) }.to raise_error("Cannot land plane: plane is already in the airport")
    end

    it "if an in_flight plane tries to take off" do
        expect{ plane.take_off }.to raise_error("Cannot take off: plane is already in flight")
    end

    it 'that a plane cannot be in the airport as it is already flying' do
      expect{ plane.airport }.to raise_error("Is not in airport: as it is already flying")
    end
  end

    it "should store the plane at the airport it lands at" do
      plane.land(airport)
      expect(plane.airport).to eq(airport)
    end
end
