# spec/ exhibit_spec.rb

require './lib/exhibit'  # Load the Exhibit class file

RSpec.describe Exhibit do
  it 'exists and has attributes' do
    # Create a new Exhibit instance with a name and a cost
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    # Check that the exhibit is an instance of the Exhibit class
    expect(exhibit).to be_a(Exhibit)
    
    # Check that the exhibit has a name attribute set correctly
    expect(exhibit.name).to eq("Gems and Minerals")
    
    # Check that the exhibit has a cost attribute set correctly
    expect(exhibit.cost).to eq(0)
  end
end