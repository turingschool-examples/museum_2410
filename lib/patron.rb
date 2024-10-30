class Patron
    attr_reader :name,
                :spending_money,
                :interests

    def initialize(name, money)
        @name = name
        @spending_money = money
        @interests = []
    end

    def add_interest(new_interest)
        @interests << new_interest
    end
end