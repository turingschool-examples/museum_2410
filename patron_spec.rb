require './lib/exhibit'
require './lib/patron'
require './lib/museum'


RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 40)

  end

  describe "#initialize" do
    it "Initializes" do
      expect(@board).to be_a Board
    end

    it "names multiple patrons" do
      expect(@patron_1.name).to eq("Bob")
      expect(@patron_2.name).to eq("Sally")
    end

    it "adds varying spending_money amounts" do
      expect(@patron_1.spending_money).to eq(20)
      expect(@patron_2.spending_money).to eq(40)
    end

    it "creates an empty array for interests" do
      expect(@patron_1.interests).to eq([])
      expect(@patron_2.interests).to eq([])
    end
  end

  it "adds interests in an array in multiple creations" do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    
    expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])

    @patron_2.add_interest("IMAX")
    expect(@patron_2.interests).to eq(["IMAX"])

  end
end
