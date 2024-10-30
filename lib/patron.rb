class Patron
  attr_reader :name, :money, :interests

  def initialize(name, spending_money)
    @name = name
    @spending_money = money
    @interests = []
  end


  def add_interest(interest)
    @interests << interest
  end
end