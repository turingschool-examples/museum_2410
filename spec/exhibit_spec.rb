require 'rspec'
require './lib/exhibit'

RSpec.describe Exhibit do
  describe '#initialize' do
    it 'exists' do
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
      expect(exhibit).to be_an_instance_of(Exhibit)
    end

    it 'has attributes' do
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
      
      expect(exhibit.name).to eq("Gems and Minerals")
      expect(exhibit.cost).to eq(0)
    end

    it 'can have different attributes' do
      exhibit = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})

      expect(exhibit.name).to eq("Dead Sea Scrolls")
      expect(exhibit.cost).to eq(10)
    end
  end
end