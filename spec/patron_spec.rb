require 'rspec'
require './lib/patron'

RSpec.describe Patron do
  describe '#initialize' do
    it 'exists' do
      patron = Patron.new("Bob", 20)
      expect(patron).to be_an_instance_of(Patron)
    end

    it 'has attributes' do
      patron = Patron.new("Bob", 20)

      expect(patron.name).to eq("Bob")
      expect(patron.spending_money).to eq(20)
      expect(patron.interests).to eq([])
    end

    it 'can have some different attributes' do
      patron = Patron.new("Lisa", 50)

      expect(patron.name).to eq("Lisa")
      expect(patron.spending_money).to eq(50)
      expect(patron.interests).to eq([])
    end
  end

  describe '#add_interest' do
    it 'adds an interest to the patrons list of interests' do
      patron = Patron.new("Lisa", 50)

      expect(patron.interests).to eq([])
      patron.add_interest("Dead Sea Scrolls")
      expect(patron.interests).to eq(["Dead Sea Scrolls"])
      patron.add_interest("Gems and Minerals")
      expect(patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end

    it 'does not affect other patrons' do
      patron = Patron.new("Lisa", 50)
      patron2 = Patron.new("Bob", 20)

      expect(patron.interests).to eq([])
      expect(patron2.interests).to eq([])

      patron.add_interest("Dead Sea Scrolls")
      expect(patron.interests).to eq(["Dead Sea Scrolls"])
      expect(patron2.interests).to eq([])
    end
  end
end