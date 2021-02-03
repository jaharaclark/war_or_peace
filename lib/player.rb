require 'pry'
class Player
  attr_reader :name, :deck 
  
  def initialize(name, deck)
      @name = name
      @deck = deck
  end

  def has_lost?
    # require 'pry'; binding.pry
    if @deck.cards == []
      return true
    else
      return false
    end
  end
end