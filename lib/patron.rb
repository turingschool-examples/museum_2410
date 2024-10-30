class Patron 
    attr_reader :name, :spending_money

    def initialize(name, spending_money)
        @name = name
        @spending_money = spending_money
        @interests = []
    end

    def name 
        @name
    end

    def spending_money
        @spending_money
    end

    def interests
        
    end
end
