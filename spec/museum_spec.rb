require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
        
        @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})

        @patron_1 = Patron.new("Bob", 20)
        @patron_2 = Patron.new("Sally", 20)
        @patron_3 = Patron.new("Will", 50)

        @dmns.admit(@patron_1)
        @dmns.admit(@patron_2)
    end

    describe '#initialize' do
        it 'is a museum' do
            expect(@dmns).to be_a(Museum)
        end
    end

    describe '#add_exhibit' do
        it 'can add a new exhibit to the museum' do
            @dmns.add_exhibit(@gems_and_minerals)

            expect(@dmns.exhibits).to include(@gems_and_minerals)
            expect(@dmns.exhibits.length).to eq(1)
        end

        it 'can add multiple exhibits to the museum' do
            @dmns.add_exhibit(@gems_and_minerals)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)

            expect(@dmns.exhibits).to include(@gems_and_minerals, @dead_sea_scrolls, @imax)
            expect(@dmns.exhibits.length).to eq(3)
        end
    end

    describe '#recommend_exhibits' do
        before(:each) do
            @dmns.add_exhibit(@gems_and_minerals)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)
        end
        
        it 'can recommend an exhibit to a patron if their interests match' do    
            @patron_1.add_interest("Gems and Minerals")
            recommendations = @dmns.recommend_exhibits(@patron_1)

            expect(recommendations).to include(@gems_and_minerals)
            expect(recommendations.length).to eq(1)
        end

        it 'can recommend multiple exhibits to a patron if multiple interests match' do
            @patron_1.add_interest("Gems and Minerals")
            @patron_1.add_interest("Dead Sea Scrolls")
            recommendations = @dmns.recommend_exhibits(@patron_1)

            expect(recommendations).to include(@gems_and_minerals, @dead_sea_scrolls)
            expect(recommendations.length).to eq(2)
        end

        it 'only recommends the exhibit that matches the patrons interests' do
            @patron_2.add_interest("IMAX")
            recommendations = @dmns.recommend_exhibits(@patron_2)

            expect(recommendations).to include(@imax)
            expect(recommendations.length).to eq(1)
        end
        
        it 'returns an empty array if no interests match the exhibits' do
            @patron_3.add_interest("Dinosaur World!")
            recommendations = @dmns.recommend_exhibits(@patron_3)

            expect(recommendations). to eq([])
        end 
    end

    describe '#admit' do
        it 'can admit multiple patrons into the museum' do
            expect(@dmns.patrons).to eq([])

            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)

            expect(@dmns.patrons.length).to eq(3)
        end
    end


    describe '#patrons_by_exhibit_interest' do
        it ''
    end
end