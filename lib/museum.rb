class Museum
    attr_reader :name,
                :exhibits,
                :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @recommend_exhibits = []
        @patrons = []
        @lottery_contestants = []
        @winner = nil
    end

    def add_exhibit(exhibit_name)
        @exhibits << exhibit_name
    end

    def recommend_exhibits(visitor)
        @exhibits.select do |exhibit|
            if visitor.interests.include?(exhibit.name)
                @recommend_exhibits << exhibit
            end
        end 
    end
    
    def admit(patron_entered)
        @patrons << patron_entered
    end
    
    def patrons_by_exhibit_interest
        pbei = {}
        @exhibits.each do |exhibit|
          patron = @patrons.select do |patron|
            patron.interests.include?(exhibit.name)
          end
          pbei[exhibit] = patron
        end
        pbei
    end

    def ticket_lottery_contestants(interested_exhibit)
        @lottery_exhibit = interested_exhibit
        @exhibits.each do |exhibit|
            @lottery_contestants = @patrons.select do |patron|
                patron.spending_money < exhibit.cost
            end
        end
        @lottery_contestants
    end

    def draw_lottery_winner
        if @lottery_contestants.count > 0
            @winner = @lottery_contestants.sample
        else
            @winner
        end
    end

    def announce_lottery_winner
        if @winner == nil
            puts "No winners for this lottery"
        else
            puts"#{@winner.name} has won the #{@lottery_exhibit.name} exhibit lottery"
        end
    end
end