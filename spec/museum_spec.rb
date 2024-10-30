require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'rspec'

RSpec.describe Museum do
  describe "instantiation" do
    it 'has a name' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    it 'can have exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns.exhibits).to eq []
    end
  end
end