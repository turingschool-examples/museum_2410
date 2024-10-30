# Iteration 1: Exhibit and Patron Classes

**Objectives:**
- Develop Exhibit and Patron classes using TDD to match the provided interaction pattern.
- **Exhibit Class:** Should initialize with a name and cost.
- **Patron Class:** Requires attributes for name, spending_money, and an empty array for interests. Implement an add_interest method for patrons.

## Error:
``` ruby
hani-sagal@Mac museum_2410 % rspec spec/exhibit_spec.rb

An error occurred while loading ./spec/exhibit_spec.rb.
Failure/Error:
  RSpec.describe Exhibit do
    it 'exists and has attributes' do
      # Create a new Exhibit instance with a name and a cost
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  
      # Check that the exhibit is an instance of the Exhibit class
      expect(exhibit).to be_a(Exhibit)
      
      # Check that the exhibit has a name attribute set correctly
      expect(exhibit.name).to eq("Gems and Minerals")

NameError:
  uninitialized constant Exhibit
# ./spec/exhibit_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.00002 seconds (files took 0.09977 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
```

## Solution:
- I haven't bulit the ` exhibit` class yet.

## Error:
``` ruby
hani-sagal@Mac museum_2410 % rspec spec/patron_spec.rb

An error occurred while loading ./spec/patron_spec.rb.
Failure/Error:
  RSpec.describe Patron do
    it 'exists and has attributes' do
      # Create a new Patron instance with a name and spending money
      patron = Patron.new("Bob", 20)
  
      # Check that the patron is an instance of the Patron class
      expect(patron).to be_a(Patron)
      
      # Check that the patron has a name attribute set correctly
      expect(patron.name).to eq("Bob")

NameError:
  uninitialized constant Patron
# ./spec/patron_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.00002 seconds (files took 0.0996 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
```
## Solution: 
- - I haven't bulit the ` exhibit` class yet.


## Error:
``` ruby

```
## Solution: 
- - I haven't bulit the ` exhibit` class yet.