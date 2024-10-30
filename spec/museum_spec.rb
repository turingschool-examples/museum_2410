require 'rspec'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe Museum do
  describe '#initialize' do
    it 'exists' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_an_instance_of(Museum)
    end

    it 'has attributes' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end

    it 'can have a different attribute' do
      dmns = Museum.new("Virginia Living Museum")

      expect(dmns.name).to eq("Virginia Living Museum")
      expect(dmns.exhibits).to eq([])
    end
  end
end