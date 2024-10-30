class Museum
  attr_reader :name

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    
  end

  def admit
    
  end

  def patrons
    
  end

  def patrons_by_exhibit_interest
    
  end

  def ticket_lottery_contestants
    
  end

  def draw_lottery_winner(exhibit)
    
  end

  def announce_lottery_winner(lottery_winner)
end