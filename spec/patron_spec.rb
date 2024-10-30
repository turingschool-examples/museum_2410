require './lib/patron'

RSpec.describe 'Patron' do
    describe '#instantiate' do
        it 'is an instance of Patron' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1).to be_a(Patron)
        end
    end

    describe '#initialize' do
        it 'has a name and money' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1.name).to eq("Bob")
            expect(patron_1.spending_money).to eq(20)
        end
    end

    describe '#add_interest' do
        it 'starts with no interests' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1.interests).to eq([])
        end

        it 'is able to add interests' do
            patron_1 = Patron.new("Bob", 20)
            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")

            expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end