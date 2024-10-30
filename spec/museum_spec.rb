require 'rspec'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

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
      expect(dmns.patrons).to eq([])
    end

    it 'can have a different attribute' do
      vlm = Museum.new("Virginia Living Museum")

      expect(vlm.name).to eq("Virginia Living Museum")
      expect(vlm.exhibits).to eq([])
      expect(vlm.patrons).to eq([])
    end
  end

  describe '#add_exhibit' do
    it 'can add exhibits to its list of exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      expect(dmns.exhibits).to eq([])
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      expect(dmns.exhibits).to contain_exactly(gems_and_minerals, dead_sea_scrolls, imax)
    end

    it 'does not affect other museums' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      vlm = Museum.new("Virginia Living Museum")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      expect(vlm.exhibits).to eq([])
      expect(dmns.exhibits).to eq([])
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      expect(vlm.exhibits).to eq([])
      expect(dmns.exhibits).to contain_exactly(gems_and_minerals, dead_sea_scrolls, imax)
    end
  end

  describe '#recommend_exhibits' do
    it 'recommends all exhibits to a patron that matches their interests' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      patron_1 = Patron.new("Bob", 20)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("IMAX")

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      expect(dmns.recommend_exhibits(patron_1)).to contain_exactly(dead_sea_scrolls, gems_and_minerals)
      expect(dmns.recommend_exhibits(patron_2)).to contain_exactly(imax)
    end
  end

  describe '#admit' do
    it 'adds patrons to its list of patrons' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      
      patron_1 = Patron.new("Bob", 20)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      expect(dmnv.patrons).to eq([])

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmnv.patrons).to eq([patron_1, patron_2, patron_3])
    end
  end

  describe '#patrons_by_exhibit_interest' do
    it 'returns a hash of exhibit keys with values of patrons with an interest in the exhibit' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      patron_1 = Patron.new("Bob", 20)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      patron_2.add_interest("Dead Sea Scrolls")
      patron_3.add_interest("Dead Sea Scrolls")

      expect(dmns.patrons_by_exhibit_interest.keys.count).to eq(3)
      expect(dmns.patrons_by_exhibit_interest[dead_sea_scrolls]).to contain_exactly(patron_1, patron_2, patron_3)
      expect(dmns.patrons_by_exhibit_interest[gems_and_minerals]).to contain_exactly(patron_1)
      expect(dmns.patrons_by_exhibit_interest[imax]).to contain_exactly()
    end
  end

  describe '#ticket_lottery_contestants' do
    it 'returns an array of patrons too poor to attend an exhibit of interest' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      patron_1 = Patron.new("Bob", 0)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")
      patron_2.add_interest("Dead Sea Scrolls")
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to contain_exactly(patron_1, patron_3)
    end
  end
end