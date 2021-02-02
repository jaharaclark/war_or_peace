require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class Test < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Deck, @deck
    assert_equal @cards, @deck.cards
  end

  def test_it_can_have_rank_of_card_at 
    assert_equal 12, @deck.rank_of_card_at(0) 
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_it_can_have_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_has_percent_high_ranking
    assert_equal @cards, @deck.cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
    assert_equal 66.67, @deck.percent_high_ranking  
  end
end