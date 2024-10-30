require './lib/exhibit'
require './lib/patron'
require 'pry'

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

    def recommend_exhibits(patron)
        recommendations = []

        patron.interests.each do |interest|
            @exhibits.each do |exhibit|
                if exhibit.name == interest
                    recommendations << exhibit
                else 
                    next
                end
            end
        end
        return recommendations
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest  
        hash = {
            gems_and_minerals: [],
            dead_sea_scrolls: [],
            imax:[]
        }
        @patrons.each do |patron|
            patron.interests.each do |interest|
                if interest.include? ("Gems and Minerals")
                    hash[:gems_and_minerals] << patron
                end

                if interest.include? ("Dead Sea Scrolls")
                    hash[:dead_sea_scrolls] << patron
                end

                if interest.include? ("imax")
                    hash[:imax] << patron
                end
            end
        end
        hash
    end
end