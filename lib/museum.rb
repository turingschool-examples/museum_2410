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
    recommended = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommended << exhibit
      end
    end
    return recommended
  end

  def admit(patron)
    if !patrons.include?(patron)
      @patrons << patron
    end
  end

  def patrons_by_exhibit_interest
    by_exhibit = {}
    @exhibits.each do |exhibit|
      by_exhibit[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          by_exhibit[exhibit] << patron
        end
      end
    end
    return by_exhibit
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit = patrons_by_exhibit_interest
    patrons_by_exhibit[exhibit]
  end
  
  def draw_lottery_winner(exhibit)
    contestant_objects = ticket_lottery_contestants(exhibit)
    contestants_array = []
    contestant_objects.each do |contestant|
      contestants_array << contestant.name
    end
    
    if !contestants_array.empty?
      return contestants_array.sample
    else
      return nil
    end
  end
  
  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    
    if winner != nil
      return "#{winner} has won the #{exhibit.name} exhibit lottery"
    else
      return "No winners for this lottery"
    end
  end
end