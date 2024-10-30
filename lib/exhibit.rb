class Exhibit

    attr_reader :name, :cost

    def initialize(exhibit_details)
        @name = exhibit_details[:name]
        @cost = exhibit_details[:cost]
    end
end

