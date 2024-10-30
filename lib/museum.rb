class Museum
  attr_reader :name, :exhibits, :patrons


  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    
  end

  def ticket_lottery_contestants(exhibit)
    
  end

  def draw_lottery_winner(exhibit)
    
  end

  def announce_lottery_winner(exhibit_lottery_winner)
end