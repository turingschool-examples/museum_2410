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
        @patron_2 = Patron.new("Sally", 20)
        @patron_3 = Patron.new("Johnny", 5)
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

    describe "#recommend_exhibits" do
        it "can recommend exhibits that match Patron's interests" do
            expect(@patron_1.interests).to eq([])
            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_1.add_interest("Gems and Minerals")
            expect(@patron_1.interests.size).to eq(2)
            expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])

            expect(@patron_2.interests).to eq([])
            @patron_2.add_interest("IMAX")
            expect(@patron_2.interests.size).to eq(1)
            expect(@patron_2.interests).to eq(["IMAX"])

            @dmns.add_exhibit(@gems_and_minerals)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)
            expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])

            @dmns.recommend_exhibits(@patron_1)
            expect(@dmns.recommend_exhibits(@patron_1).size).to eq(2)
            expect(@dmns.recommend_exhibits(@patron_1)).to match_array([@gems_and_minerals, @dead_sea_scrolls])

            @dmns.recommend_exhibits(@patron_2)
            expect(@dmns.recommend_exhibits(@patron_2).size).to eq(1)
            expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
        end
    end

    describe "#admit" do
        it "can add patron to patrons array" do
            expect(@dmns.patrons).to eq([])

            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)
            
            expect(@dmns.patrons.size).to eq(3)
            expect(@dmns.patrons).to match_array([@patron_1, @patron_2, @patron_3])
        end
    end

    describe "#patrons_by_exhibit_interest" do
        it "can return a hash where each key is an exhibit and the value is an array of the patrons interest" do
            @dmns.add_exhibit(@gems_and_minerals)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)

            #Bob
            @patron_1.add_interest("Gems and Minerals")
            @patron_1.add_interest("Dead Sea Scrolls")
            
            #Sally
            @patron_2.add_interest("Dead Sea Scrolls")

            #John
            @patron_3.add_interest("Dead Sea Scrolls")

            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)
            @dmns.patrons

            expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
            expect(@dmns.patrons_by_exhibit_interest).to eq(
                {
                    gems_and_minerals: [@patron_1],
                    dead_sea_scrolls: [@patron_1, @patron_2, @patron_3],
                    imax: []
                }
            )
        end
    end
end