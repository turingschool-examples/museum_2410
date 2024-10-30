require 'spec_helper'

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
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_interests = {}
    @exhibits.each do |exhibit|
      museum_patrons = @patrons.select do |patron|
        patron.interests.include?(exhibit.name)
      end
      patron_interests[exhibit] = museum_patrons
    end
    patron_interests
  end
end