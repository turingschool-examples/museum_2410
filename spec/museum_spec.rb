require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Museum do 
    before(:each) do
        @dmns = Museum.new("Denver Meseum of Nature and Science")
    end

    describe "#name" do
        it "can display museum name" do
            expect(@dmns.name).to eq("Denver Meseum of Nature and Science")
        end
    end
end