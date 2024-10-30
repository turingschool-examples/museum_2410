require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'pry'

RSpec.describe Museum do
  describe '#initialize' do
    it 'exists' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_an_instance_of(Museum)
    end

    it 'has attributes' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end
  end

  describe 'add_exhibit' do
    it 'can add exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
    end
  end

  describe 'add_interest' do
    it 'patron_1 can add interests' do
      patron_1 = Patron.new("Bob", 20)

      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end

    it 'patron_2 can add interests' do
      patron_2 = Patron.new("Sally", 20)

      patron_2.add_interest("IMAX")

      expect(patron_2.interests).to eq(["IMAX"])
    end
  end

  describe '#recommend_exhibits' do
    it 'can recommend exhibits to patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      patron_1 = Patron.new("Bob", 0)
      
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      

      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(gems_and_minerals)
      
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      dmns.recommend_exhibits(patron_1)

      expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
    end

    it 'can recommend exhibits to patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      patron_2 = Patron.new("Sally", 20)
      imax = Exhibit.new({name: "IMAX",cost: 15})
      
      
      dmns.add_exhibit(imax)
      
      patron_2.add_interest("IMAX")

      dmns.recommend_exhibits(patron_2)

      expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
    end
  end
end