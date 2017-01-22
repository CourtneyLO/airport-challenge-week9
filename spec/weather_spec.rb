require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  context'#condition' do
      it "should return stormy" do
      allow(weather).to receive(:condition).and_return("stormy")
      expect(weather.condition).to eq("stormy")
    end
  end
end
