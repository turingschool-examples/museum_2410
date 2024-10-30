require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Patron do 
    before(:each) do
        @patron_1 = Patron.new("Bob", 20)
    end

    describe "#name" do
        it "can display patron name" do
            expect(@patron_1.name).to eq("Bob")
        end
    end

    describe "#spending_money" do
        it "can display patron spending money" do
            expect(@patron_1.spending_money).to eq(20)
        end
    end

    describe "#interests" do
        it "can add interests to the interests array" do
            expect(@patron_1.interests).to eq([])
            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_1.add_interest("Gems and Minerals")
            expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end