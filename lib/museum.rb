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
    recommended_exhibits = @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end

    recommended_exhibits.sort_by! do |exhibit|
      exhibit.name
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_interests = Hash.new { |hash, key| hash[key] = [] }

    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patron_interests[exhibit] << patron
        end
      end
    end

    patron_interests
  end

  def ticket_lottery_contestants(exhibit)
    contestants = patrons_by_exhibit_interest[exhibit].find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end
end