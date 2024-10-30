# Iteration 2: Museum Class with Recommendations

**Objectives:**
- Create the `Museum`class with the ability to add exhibits and recommend them based on patron interests.
- Implement `recommend_exhibits` to match exhibits with patron interests.

## Error:
``` ruby
hani-sagal@Mac museum_2410 % rspec spec/museum_spec.rb                                                              

While loading ./spec/museum_spec.rb a `raise SyntaxError` occurred, RSpec will now quit.
Failure/Error: __send__(method, file)

SyntaxError:
  --> /Users/hani-sagal/turing_work/1mod/IC_challenges/Week_4_Challenge/museum_2410/spec/museum_spec.rb
  Unmatched `(', missing `)' ?
     5  Rspec.describe Museum do
    30    it 'cam recommend exhibits based on patron interests' do
  > 31      denvermns = Museum.new("Denver Museum of Nature and Science")
  > 32      gems_and_minls = Exhibit.new({name: "Gems and Minerals", cost: 0})
  > 33      dead_sea_scrolls = Exhibit.new({name: "Dead Sead Scrolls, cost: 10"})
  > 34      cinemax = Exhibit.new({name: "Cinemax", cost: 15})
  > 36      denvermns.add_exhibit(gems_and_minls)
  > 37      denvermns.add_exhibit(dead_sea_scrolls)
  > 38      denvermns.add_exhibit.(cinemax)
  > 40      patron_1 = Patron.new("Scarlett", 20)
  > 41      patron_1.add_interest("Dead Sea Scrolls")
  > 42      patron_1.add_interest("Gems and Minerals")
  > 44      patron_2 = Patron.new("Solaine", 20)
  > 45      patron_2.add_interest("Cinemax")
  > 47      expect(denvermns.recommend_exhibit(patron_1)).to eq([gems_and_minls, dead_sea_scrolls])
  > 48      expect(denvermns.recommend_exhibit(patron_2). to eq([cinemax]
    49    end
    50  end/Users/hani-sagal/turing_work/1mod/IC_challenges/Week_4_Challenge/museum_2410/spec/museum_spec.rb:49: syntax error, unexpected `end', expecting ')' (SyntaxError)
    end
    ^~~
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/configuration.rb:2144:in `load'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/configuration.rb:2144:in `load_file_handling_errors'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/configuration.rb:1643:in `block in load_spec_files'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/configuration.rb:1641:in `each'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/configuration.rb:1641:in `load_spec_files'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/runner.rb:102:in `setup'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/runner.rb:86:in `run'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/runner.rb:71:in `run'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/lib/rspec/core/runner.rb:45:in `invoke'
# /Users/hani-sagal/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/rspec-core-3.13.2/exe/rspec:4:in `<top (required)>'
# /Users/hani-sagal/.rbenv/versions/3.2.2/bin/rspec:25:in `load'
# /Users/hani-sagal/.rbenv/versions/3.2.2/bin/rspec:25:in `<main>'
# 
#   Showing full backtrace because every line was filtered out.
#   See docs for RSpec::Configuration#backtrace_exclusion_patterns and
#   RSpec::Configuration#backtrace_inclusion_patterns for more information.

Finished in 0.00011 seconds (files took 0.15357 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

hani-sagal@Mac museum_2410 % 
```

## Solution:
- As always, I syntax error ugh!!! I need to slow down.
1.	**Missing Closing Braces:**
    - In dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls, cost: 10"}), there’s a missing double-quote after "Dead Sea Scrolls".
2.	**Extra Period:**
    - In denvermns.add_exhibit.(cinemax), there’s an extra period after add_exhibit.
3.	**Unclosed Parenthesis in Expectations:**
    - In expect(denvermns.recommend_exhibit(patron_2).to eq([cinemax], I am missing a closing parenthesis and bracket for the expect statement.

## Error: Did not captialize spell RSpec correctly
``` ruby

An error occurred while loading ./spec/museum_spec.rb.
Failure/Error:
  Rspec.describe Museum do
    it 'exist and had attributes' do
  
      denvermns = Museum.new("Denver Museum of Nature and Science")
  
      expect(denvermns).to be_a(Museum)
  
      expect(denvermns.name).to eq("Denver Museum of Nature and Science")
  
      expect(denvermns.exhibit). to eq([])

NameError:
  uninitialized constant Rspec
# ./spec/museum_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.00002 seconds (files took 0.10173 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

hani-sagal@Mac museum_2410 % 
```

## Solution:
- 


## Error:
``` ruby

```

## Solution:
- 

## Error:
``` ruby

```

## Solution:
- 