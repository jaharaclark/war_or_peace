class Deck
  attr_reader :cards 
  def initialize(cards)
    @cards = cards
  end

  # def cards
  #   @cards = cards
  # end

  def rank_of_card_at(index)
    cards.at(index).rank
  end  

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
        if card.rank >= 11
            high_cards.push(card)
        end
    end
    high_cards
  end

  def percent_high_ranking
    high_card_length = high_ranking_cards.length.to_f
    card_array_length = cards.length.to_f
    partial_answer = high_card_length/card_array_length
    closer_answer = partial_answer * 100
    final_answer = closer_answer.round(2)
  end 

 def remove_card
    cards.shift
  end 

  def add_card(new_card)
    cards << new_card
  end
end