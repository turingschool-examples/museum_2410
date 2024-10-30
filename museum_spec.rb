require './lib/exhibit'
require './lib/patron'
require './lib/museum'


RSpec.describe Patron do
  before(:each) do
    dmns = Museum.new("Denver Museum of Nature and Science")
  end

  describe "#initialize" do
    it "Initializes" do
      expect(@board).to be_a Board
    end

    it "returns museum name" do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end


    it "creates an empty array for exhibits" do
      expect(@dmns.exhibits).to eq([])
    end
  end

  it "adds creates an array of exhibits" do
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)

    expect(@dmns.exhibits).to eq(gems_and_minerals, dead_sea_scrolls, imax)
  end

  it "can recommend exhibits to patrons" do
    expect(@dmns.recommend_exhibits(patron_1)).to eq()
    expect(@dmns.recommend_exhibits(patron_1)).to eq()
  end

end
``
