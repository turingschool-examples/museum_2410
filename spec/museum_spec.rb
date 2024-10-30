require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'rspec'

RSpec.describe Museum do
  describe "instantiation" do
    it 'has a name' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    it 'can have exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns.exhibits).to eq []
    end

    it 'can list patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      
      expect(dmns.patrons).to eq []
    end
  end

  describe "behaviors" do
    it 'can add exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      expect(dmns.exhibits.count).to eq 3
    end

    it 'can recommend interests to patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1 = Patron.new("Bob", 20)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("IMAX")

      expect(dmns.recommend_exhibits(patron_1).count).to eq 2
      expect(dmns.recommend_exhibits(patron_2).count).to eq 1
    end

    it 'can admit patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      
      patron_1 = Patron.new("Bob", 0)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.patrons.count).to eq 3
    end

    it 'can return a hash of exhibits and interested patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1 = Patron.new("Bob", 0)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")

      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.patrons_by_exhibit_interest).to be_a Hash
    end
  end

  describe "lottery system" do 
    it 'can return an array of patrons whose #spending_money < #exhibit.cost' do
      dmns = Museum.new("Denver Museum of Nature and Science")
        
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1 = Patron.new("Bob", 0)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")

      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to be_a Array
      expect(dmns.ticket_lottery_contestants(dead_sea_scrolls).count).to eq 2

      expect(dmns.ticket_lottery_contestants(gems_and_minerals)).to eq []
      expect(dmns.ticket_lottery_contestants(imax)).to eq []
    end

    it 'can draw a lottery winner if there are entrants' do
      dmns = Museum.new("Denver Museum of Nature and Science")
        
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1 = Patron.new("Bob", 0)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")

      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to be_a String
    end

    it 'will return #nil if there are no entrants' do
    dmns = Museum.new("Denver Museum of Nature and Science")
        
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")

    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("Dead Sea Scrolls")

    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interest("Dead Sea Scrolls")

    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.draw_lottery_winner(gems_and_minerals)).to eq nil
    expect(dmns.draw_lottery_winner(imax)).to eq nil
    end

    it 'can announce a lottery winner' do
      dmns = Museum.new("Denver Museum of Nature and Science")
        
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1 = Patron.new("Bob", 0)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")

      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.announce_lottery_winner(dead_sea_scrolls)).to be_a String

      expect(dmns.announce_lottery_winner(gems_and_minerals)).to eq "No winners for this lottery."
      expect(dmns.announce_lottery_winner(imax)).to eq "No winners for this lottery."
    end
  end
end