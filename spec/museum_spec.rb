require 'pry'
require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
    describe '#initialize' do
        it 'exists' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            expect(dmns).to be_a(Museum)
        end

        it 'has attributes' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            expect(dmns.name).to eq("Denver Museum of Nature and Science")
            expect(dmns.exhibits).to be_a(Array)
            # expect(dmns.exhibits).to eq([])
        end
    end

    describe '#exhibits' do
        it 'can add and show exhibits' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            
            gems_and_minerals = Exhibit.new({ name: "Gems and Minerals", cost: 0 })
            dead_sea_scrolls = Exhibit.new({ name: "Dead Sea Scrolls", cost: 10 })
            imax = Exhibit.new({ name: "IMAX", cost: 15 })

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end

        it 'can recommend exhibits' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX", cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new({ name: "Bob", spending_money: 20, interests: ["Gems and Minerals", "Dead Sea Scrolls"] })
            patron_2 = Patron.new({ name: "Sally", spending_money: 20, interests: ["IMAX"] })

            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end
    
    describe '#admits_patrons' do
        it 'admits patrons' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            patron_1 = Patron.new({ name: "Bob", spending_money: 20, interests: ["Gems and Minerals", "Dead Sea Scrolls"] })
            patron_2 = Patron.new({ name: "Sally", spending_money: 20, interests: ["IMAX"] })
            patron_3 = Patron.new({ name: "Johnny", spending_money: 5, interests: ["Dead Sea Scrolls"] })

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)
        end
    end
end