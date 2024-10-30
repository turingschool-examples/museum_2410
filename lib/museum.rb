# lib/museum.rb

class Museum
  # Provides access to the `name` and `exhibits` attributes
  attr_reader :name, :exhibits

  # Initializes the Museum with a name and an empty exhibits array
  def initialize(name)
    @name = name
    @exhibits = []
  end

  # Adds an exhibit to the exhibits array
  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  # Recommends exhibits to a patron based on their interests
  def recommend_exhibits(patron)
    # Filters exhibits that match any of the patron's interests
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end
end