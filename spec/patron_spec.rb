require 'spec_helper'

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new("bob", 20)
  end
  describe "intitlaize" do
    it "exitis with attributes" do
      expect(@patron_1.name).to eq("bob")
      expect(@patron_1.spending_money).to eq(20)
      expect(@patron_1.interests).to eq([])
    end
  end
  describe "add_interest" do
    it "adds interest to interests array" do
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")

      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end
end
