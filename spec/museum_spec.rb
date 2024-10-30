require 'spec_helper'


RSpec.describe Patron do
    describe '#instantiation' do
        it 'exists' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns).to be_a(Museum)
        end
    end

    describe '#initialize' do
        it 'has attributes' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns.name).to eq("Denver Museum of Nature and Science")
        end
    end

    describe '#exhibits' do
        it 'starts as an empty array of museusm exhibits' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns.exhibits).to eq([])
        end
    end

    describe '#add_exhibit' do
        it 'adds and exhibit to the museums exhibits array' do
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

    describe '#recommend_exhibits' do
        it 'recommends exhibits based on a patrons interests' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            
            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Sally", 20)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("IMAX")

            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end

    describe '#patrons' do
        it 'starts as an empty array of patrons' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.patrons).to eq([])
        end
    end

    describe '#admit' do
        it 'admits patrons into the patrons array' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
        end
    end

    describe '#patrons_by_exhibit_interest' do
        xit 'returns a Hash where each key is an exhibit and the value is an array of all the patrons that have an interest in that exhibit' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            
            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)
            
            expect(dmns.patrons_by_exhibit_interest).to eq({gems_and_minerals: [patron_1], dead_sea_scrolls: [patron_1, patron_2, patron_3], imax: []})
        end
    end

    describe '#contestants' do
        it 'is an empty array of contests for an exhibits lottry' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns.contestants).to eq([])
        end
    end

    describe '#ticket_lottery_contestants' do
        it 'returns an array of patrons that do not have enough money to see an exhibit, but are interested in that exhibit' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            
            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
        end
    end

    describe '#draw_lottery_winner' do
        it 'generates a random lottery winner from the ticket_lottery_contestants array' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            
            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            dmns.ticket_lottery_contestants(dead_sea_scrolls)

            expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to be_a(Patron)

            dmns.ticket_lottery_contestants(gems_and_minerals)

            expect(dmns.draw_lottery_winner(gems_and_minerals)).to be(nil)
        end
    end

    describe '#announce_lottery_winner' do
        it 'announces the patron that won the lottery' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            
            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            dmns.ticket_lottery_contestants(imax)

            dmns.draw_lottery_winner(imax)
            
            expect(dmns.announce_lottery_winner(imax)).to be_a(String)

            dmns.ticket_lottery_contestants(gems_and_minerals)

            dmns.draw_lottery_winner(gems_and_minerals)

            expect(dmns.announce_lottery_winner(gems_and_minerals)).to be_a(String)
        end
    end
end