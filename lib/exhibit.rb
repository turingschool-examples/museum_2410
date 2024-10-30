class Exhibit 
    attr_reader :hash

    def initialize(hash)
        @name = hash[:name]
        @cost = hash[:cost]
    end

    def name 
        @name
    end

    def cost
        @cost
    end
end
