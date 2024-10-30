require "spec_helper"

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
  end

  describe "intitalize" do
    it "exitis with attrbibutes" do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to eq([])
    end
  end

  describe "add_exhibit" do
    it "adds exhibit to exhibits array" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      expect(@dmns.exhibits).to be_an(Array)
      expect(@dmns.exhibits[0]).to be_a_instance_of(Exhibit)
      expect(@dmns.exhibits.length).to eq(3)
    end
  end

  describe "recommend_exhibits" do
    it "recommends exhibits to patrons based on interests" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      expect(@dmns.recommend_exhibits(@patron_1)).to be_an(Array)
      expect(@dmns.recommend_exhibits(@patron_1)).to contain_exactly(@gems_and_minerals, @dead_sea_scrolls)
      @patron_2.add_interest("IMAX")
      expect(@dmns.recommend_exhibits(@patron_2)).to contain_exactly(@imax)
    end
  end

  describe "admit" do
    it "admits patrons into the museum" do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2])
    end
  end

  describe "patrons_by_exhibit_interest" do
    it "shows all patrons interets admitted to the museum" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
      expect(@dmns.patrons_by_exhibit_interest[@gems_and_minerals]).to include(@patron_1)
      expect(@dmns.patrons_by_exhibit_interest[@imax]).to include(@patron_2)

    end
  end
end