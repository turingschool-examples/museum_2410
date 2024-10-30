require './lib/exhibit'
require './lib/patron'

RSpec.describe 'Exhibit' do
    describe '#instantiate' do
        it 'is an instance of Exhibit' do
            exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
            
            expect(exhibit).to be_a(Exhibit)
        end
    end

    describe '#initialize' do
        it 'has a name and cost' do
            exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

            expect(exhibit.name).to eq("Gems and Minerals")
            expect(exhibit.cost).to eq(0)
        end
    end
end
