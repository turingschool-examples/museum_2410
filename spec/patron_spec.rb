require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Patron do
    describe '#initialize' do
        it 'exists' do
            patron_1 = Patron.new({ name: "Bob", spending_money: 20 })
            patron_2 = Patron.new({ name: "Sally", spending_money: 20 })
            expect(patron_1).to be_a(Patron)
        end

        it 'has attributes' do
            patron_1 = Patron.new({ name: "Bob", spending_money: 20 })

            expect(patron_1.name).to eq("Bob")
            expect(patron_1.spending_money).to eq(20)
            expect(patron_1.interests).to eq([])

            patron_2 = Patron.new({ name: "Sally", spending_money: 20 })

            expect(patron_2.name).to eq("Sally")
            expect(patron_2.spending_money).to eq(20)
            expect(patron_2.interests).to eq([])
        end
    end

    describe '#interests' do
        it 'has additional interests' do
            patron_1 = Patron.new({ name: "Bob", spending_money: 20 })

            patron_1.add_interests("Dead Sea Scrolls")
            patron_1.add_interests("Gems and Minerals")
            expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])

            patron_2 = Patron.new({ name: "Sally", spending_money: 20 })

            patron_2.add_interests("IMAX")
            expect(patron_2.interests).to eq (["IMAX"])
        end
    end
end