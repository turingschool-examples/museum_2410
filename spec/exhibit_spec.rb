require './lib/exhibit'

RSpec.describe Exhibit do
        before(:each) do
            @exhibit = Exhibit.new({ name: "Gems and Minerals", cost: 0 })
        end

    describe '#initialize' do
        it 'is an exhibit' do
            expect(@exhibit).to be_a(Exhibit)
        end
    end

    describe 'details' do
        it 'has a name and a cost' do
            expect(@exhibit.name).to eq("Gems and Minerals")
            expect(@exhibit.cost).to eq(0)
        end
    end
end