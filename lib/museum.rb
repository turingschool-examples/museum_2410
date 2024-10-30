class Museum

    attr_reader :name, :exhibits, :patrons, :contestants
    
    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
        @contestants = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end
    
    def recommend_exhibits(patron)  
        recommend_exhibits = []  
        exhibits.each do |exhibit|
            if patron.interests.include?(exhibit.name)
                recommend_exhibits << exhibit
            end
        end
        recommend_exhibits
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
    end

    def ticket_lottery_contestants(exhibit)
        patrons.each do |patron|
            if patron.spending_money < exhibit.cost && patron.interests.include?(exhibit.name)
                @contestants << patron
            end
        end
        @contestants
    end

    def draw_lottery_winner(exhibit)
       winner = @contestants.sample
       @contestants.clear
       winner
    end

    def announce_lottery_winner(exhibit)
        if @contestants != nil
            "#{Patron} has won the #{Exhibit} edhibit lottery"
        else
            "No winners for this lottery"
        end
    end
end