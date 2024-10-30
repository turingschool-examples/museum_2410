require './lib/exhibit'
require './lib/patron'
require './lib/museum'


RSpec.describe Exhibit do
  before(:each) do
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  describe "#initialize" do
    it "Initializes" do
      expect(@gems_and_minerals).to be_a Exhibit
      expect(@dead_sea_scrolls).to be_a Exhibit
      expect(@imax).to be_a Exhibit

    end

    it "returns varying exhibit names" do
      expect(@gems_and_minerals.name).to eq("Gems and Minerals")
      expect(@dead_sea_scrolls.name).to eq("Dead Sea Scrolls")
      expect(@imax.name).to eq("IMAX")

    end

    it "returns varying costs" do
      expect(@gems_and_minerals.cost).to eq(0)
      expect(@dead_sea_scrolls.cost).to eq(10)
      expect(@imax.cost).to eq(15)

    end
  end
end

