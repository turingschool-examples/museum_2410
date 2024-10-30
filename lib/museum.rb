class Museum
    attr_reader :name, :cost, :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
      end
    
    def add_exhibit(exhibit)
        @exhibits << exhibit
    end
    
    def recommend_exhibits(patron)
        @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interests
end 