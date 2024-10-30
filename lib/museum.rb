class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
    
    recommended_exhibits.sort_by! do |exhibit|
      exhibit.name
    end
  end
end