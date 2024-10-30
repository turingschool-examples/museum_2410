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
end