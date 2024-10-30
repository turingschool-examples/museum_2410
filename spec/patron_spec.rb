# spec/ patron_spec.rb

require './lib/patron'  # Load the Patron class file

RSpec.describe Patron do
  it 'exists and has attributes' do
    # Create a new Patron instance with a name and spending money
    patron = Patron.new("Bob", 20)

    # Check that the patron is an instance of the Patron class
    expect(patron).to be_a(Patron)
    
    # Check that the patron has a name attribute set correctly
    expect(patron.name).to eq("Bob")
    
    # Check that the patron has spending_money set correctly
    expect(patron.spending_money).to eq(20)
    
    # Check that the interests array is initially empty
    expect(patron.interests).to eq([])
  end

  it 'can add interests' do
    # Create a new Patron instance
    patron = Patron.new("Bob", 20)
    
    # Add interests to the patron
    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")
    
    # Check that the interests array contains the added interests
    expect(patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end