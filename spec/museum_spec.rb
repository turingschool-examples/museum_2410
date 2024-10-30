require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe 'Museum' do
    describe '#instantiate' do
        it 'is a museum' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns).to be_a(Museum)
        end
    end

    describe '#initialize' do
        it 'has a name, no exibits, and no addmitted patrons when initialized' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns.name).to eq("Denver Museum of Nature and Science")
            expect(dmns.exhibits).to eq([])
            expect(dmns.patrons). to eq([])
        end
    end

    describe '#add_exhibit' do
        it 'can have different exhibits' do
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
        it 'recommends exhibits to patrons' do
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

            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end

    describe '#admit' do
        it 'patrons are added as they get admited to the museum' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            patron_1 = Patron.new("Bob", 0)
            patron_2 = Patron.new("Sally", 20)
            patron_3 = Patron.new("Johnny", 5)
            expect(dmns.patrons).to eq([])
            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
        end
    end

    describe '#patrons_by_exhibit_interest' do
        it 'provides an array of patrons interested in each exhibit' do
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

            expect(dmns.patrons_by_exhibit_interest).to eq({gems_and_minerals => [patron_1], dead_sea_scrolls => [patron_1, patron_2, patron_3], imax => []})
        end
    end

    describe '#ticket_lottery_contestants' do
        it 'provides a list of patrons that are interested in an exhibit but cannot afford it' do
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
            
            expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
        end
    end

    describe '#draw_lottery_winner' do
        it 'chooses a winner from the patrons that could not afford to see an exhibit' do
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
            dmns.ticket_lottery_contestants(dead_sea_scrolls)
            dmns.draw_lottery_winner
            # had just made the test to confirm the method was working.
        end
    end

    describe '#announce_lottery_winner' do
        it 'anounced who won the lottery ticket to the exhibit' do
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
            dmns.ticket_lottery_contestants(dead_sea_scrolls)
            dmns.draw_lottery_winner
            dmns.announce_lottery_winner
        end
    end
end


    