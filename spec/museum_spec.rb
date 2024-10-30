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
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1 = Patron.new("Bob", 20)
      @patron_1.add_interest("Dead Sea Scrolls")
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

  describe "#admit" do
    before(:each) do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1 = Patron.new("Bob", 20)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")

      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("Dead Sea Scrolls")

      @patron_3 = Patron.new("Johnny", 5)
      @patron_3.add_interest("Dead Sea Scrolls")
    end

    it "has patrons list defaulted as empty" do
      expect(@dmns.patrons).to be_empty
    end

    it "can admit patrons" do
      expect(@dmns.patrons).to be_empty

      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end

    it "can organize patrons by interest" do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      expect(@dmns.patrons_by_exhibit_interest).to eq({@gems_and_minerals => [@patron_1],
                                                      @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
                                                      @imax => []})
    end

    describe "#lottery" do
      it "determine ticket lottery contestants" do
        expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_2, @patron_3])
      end

      it "can determine a winner" do
        @dmns.ticket_lottery_contestants(@dead_sea_scrolls)

        expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to eq(" \"Johnny\" or \"Bob\" can return here. Fun!")
      end

      it "returns nil if no contestants are eligible" do
        @dmns.ticket_lottery_contestants(@imax)

        expect(@dmns.draw_lottery_winner(@imax)).to be nil
      end

      it "announces the winner" do
        @dmns.ticket_lottery_contestants(@gems_and_minerals)
        @dmns.draw_lottery_winner(@gems_and_minerals)

        expect(@dmns.announce_lottery_winner(@gems_and_minerals)).to eq("Bob has won the IMAX exhibit lottery")
      end

      it "announces a different message if these are no winners" do
        @dmns.ticket_lottery_contestants(@imax)
        @dmns.draw_lottery_winner(@imax)

        expect(@dmns.announce_lottery_winner(@imax)).to eq("No winners for this lottery")
      end
    end
  end
end