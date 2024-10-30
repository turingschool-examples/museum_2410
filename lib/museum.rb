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
    @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interest = {}

    @exhibits.each do |exhibit| 
      interested_patrons = @patrons.select { |patron| patron.interests.include?(exhibit.name) }

      exhibit_interest[exhibit] = interested_patrons
    end

    exhibit_interest
  end

  def ticket_lottery_contestants(exhibit)
    contestants = []

    @patrons.each do |patron|
      if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
        contestants << patron
      end
    end
    
    contestants
  end

  def draw_lottery_winner(exhibit)
    contestants = ticket_lottery_contestants(exhibit) 
    return nil if contestants.empty?
  
    contestants.sample.name
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)

    if winner
      "#{winner} has won the #{exhibit.name} lottery!"
    else
      "No winners for this lottery."
    end
  end
end