require './spec/spec_helper'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX", cost: 15})
  end

  describe "#initialize" do
    it "exists" do
      expect(@dmns).to be_a(Museum)
    end

    it "has a name" do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it "has exhibits defaulted to empty" do
      expect(@dmns.exhibits).to be_empty
    end
  end

  describe "#add_exhibit" do
    it "can add an exhibit" do
      expect(@dmns.exhibits).to be_empty

      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end
  end
  
  describe "#recommend_exhibits" do
    before(:each) do
      @patron_1 = Patron.new("Bob", 20)
      @parton_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")

      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("IMAX")
    end

    it "can recommend exhibits based on parton's interests" do
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
    end

    it "can recommend different exhibts for different patrons" do
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end
end