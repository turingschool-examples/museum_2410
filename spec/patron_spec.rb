require './lib/patron'

RSpec.describe Patron do
    before(:each) do
        @patron_1 = Patron.new("Bob", 20)
    end

    describe '#initialize' do
        it 'is a patron' do
            expect(@patron_1).to be_a(Patron)
        end
    end

    describe '#add_interest' do
        it 'can add interests to patron' do
            
            @patron_1.add_interest("Dead Sea Scrolls")
            expect(@patron_1.interests).to eq(["Dead Sea Scrolls"])

            @patron_1.add_interest("Gems and Minerals")
            expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end