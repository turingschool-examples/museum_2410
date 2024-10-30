class Museum 
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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
  
  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash_of_exhibits_and_patrons = {}
    
    @exhibits.each do |exhibit|
      hash_of_exhibits_and_patrons[exhibit] = []
    end
  end
end