class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end  

  def high_ranking_cards
    @cards.each do |card|
        if card.rank >= 10
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

end