require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Exhibit do 
    before(:each) do
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end

    describe "#name" do
        it "can display exhibit name" do
            expect(@exhibit.name).to eq("Gems and Minerals")
        end
    end

    describe "#cost" do
        it "can display exhibit cost" do
            expect(@exhibit.cost).to eq(0)
        end
    end
end