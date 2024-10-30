require 'spec_helper'
 
RSpec.describe Exhibit do
  before(:each) do
    @exhibit_info = { name: "Gems and Minerals", cost: 0 }
    @exhibit_1 = Exhibit.new(@exhibit_info)
  end
  describe "intitialize" do
    it "exitis with info" do
      expect(@exhibit_1.name).to eq("Gems and Minerals")
      expect(@exhibit_1.cost).to eq(0)
    end
  end
end