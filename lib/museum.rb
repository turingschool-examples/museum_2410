class Museum 

    attr_reader :name, :exhibits, :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def admit(patron)
        @patrons << patron
    end

    def recommend_exhibits(patron)
        exhibits.filter do |exhibit|
            patron.interests.include?(exhibit.name)
        end
    end

    def patrons_by_exhibit_interest
        list = {}
        @exhibits.each do |exhibit|
        patrons.interests.include?(exhibit.name)
        
     

        
    end

    def ticket_lottery_contestants

    end

    def draw_lottery_winner

    end

    def announce_lottery_winner

    end
end
