require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Museum do 
    before(:each) do
        @dmns = Museum.new("Denver Meseum of Nature and Science")
        @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})
        @patron_1 = Patron.new("Bob", 20)
    end

    describe "#name" do
        it "can display museum name" do
            expect(@dmns.name).to eq("Denver Meseum of Nature and Science")
        end
    end

    describe "#interests" do
        it "can add interests to the interests array" do
            expect(@dmns.exhibits).to eq([])
            @dmns.add_exhibit(@gems_and_minerals)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)
            expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
        end
    end
end