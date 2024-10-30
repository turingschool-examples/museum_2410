class Patron
    attr_reader :name, :spending_money, :interests

    def initialize(data)
        @name = data[:name]
        @spending_money = data[:spending_money]
        @interests = data[:interests] || []
    end

    def add_interests(interest)
        @interests << interest
    end
end