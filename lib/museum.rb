class Museum
    attr_reader :name,
                :exhibits,
                :patrons
   
    def initialize(name)
        @name = name
        @exhibits = []   
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        recommendations = []
        patron_interests = patron.interests
        @exhibits.each do |exhibit|
            if patron_interests.include?(exhibit.name)
                recommendations << exhibit
            end
        end
        recommendations
    end


    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
        # patron_interests = patron_interests(patron)
        # patron_interests.each do |interest|
        exhibit_fans = [] 
        patron_interests = @patron.interests
        @exhibits.each do |exhibit|
            @patrons.each do |patron|
                if patron_interests.include?(exhibit.name)
                    exhibit_fans[exhibit] << @patron
                end
            end
        end
    end
        #group patron interests
        #return a hash {Exhibit: [interested patrons]}

    def patron_interests(patron)
        patron.interests
    end

    def ticket_lottery_contestants(exhibit)
        ticket_lottery_contestants = [] 
        @patrons.map do |patron|
            if patron.spending_money < exhibit.cost
                ticket_lottery_contestants << patron 
            end
        end
        ticket_lottery_contestants  
    end
end



    # def museum_exhibit_names
    #     names = []
    #     @exhibits.each do |exhibit|
    #         names << exhibit.name
    #     end
    #     names
    # end

    # def recommend_exhibits(patron)
    #     recommendations = []
    #     museum_exhibit_names = @exhibits.museum_exhibit_names
    #     patron_interests = patron.interests
    #     museum_exhibit_names.each do |name|
    #         if patron_interests.include?(name)
    #             recommendations << name
    #         end
    #     end
    # end
