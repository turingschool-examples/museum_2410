require 'spec_helper'

RSpec.describe Patron do
    describe '#instantiation' do
        it 'exists' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1).to be_a(Patron)
        end
    end

    describe '#initialize' do
        it 'hass attributes' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1.name).to eq("Bob")
            expect(patron_1.spending_money).to eq(20)
        end
    end

    describe '#interests' do
        it 'starts as an empty array of patrons interests' do
            patron_1 = Patron.new("Bob", 20)

            expect(patron_1.interests).to eq([])
        end
    end

    describe '#add_interest' do
        it 'adds adds interests to the interests array' do
            patron_1 = Patron.new("Bob", 20)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")

            expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end