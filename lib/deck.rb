class Deck
  attr_reader :cards, :high_cards
  def initialize(cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end  

  def high_ranking_cards
    @cards.each do |card|
        if card.rank >= 11
            @high_cards.push(card)
        end
    end
    @high_cards
  end

  def percent_high_ranking
    high_cards = @high_cards.length.to_f
    all_other_cards = @cards.length.to_f
    partial_answer = high_cards/all_other_cards
    closer_answer = partial_answer * 100
    final_answer = closer_answer.round(2)
  end 

 def remove_card(suit, value, rank) 
    @cards.each do |card|
      if card.suit == suit && card.value == value && card.rank == rank
        @cards.delete(card)
        @high_cards.delete(card)
      end  
    end
  end 

  def add_card(new_card)
    @cards << new_card
  end
end