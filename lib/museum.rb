class Museum 
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    reccomended = []

    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        reccomended << exhibit
      end
    end
    reccomended
  end
end