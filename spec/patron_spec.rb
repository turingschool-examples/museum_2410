require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  describe "instantiation" do
    it 'has a name' do
      patron_1 = Patron.new("Bob", 20)

      expect(patron_1.name).to eq "Bob"
    end

    it 'has spending money' do
      patron_1 = Patron.new("Bob", 20)

      expect(patron_1.spending_money).to eq 20
    end

    it 'can have interests' do
      patron_1 = Patron.new("Bob", 20)

      expect(patron_1.interests).to eq []
    end
  end

  it 'can add interests' do
    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
  end
end