require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'


class PlayerTest < Minitest::Test
    def setup
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)    
      @card3 = Card.new(:heart, 'Ace', 14)    
      @deck = Deck.new([@card1, @card2, @card3])
      @player = Player.new('Clarisa', @deck)
    end

    def test_it_exists_and_has_attributes
      assert_instance_of Player, @player
      assert_equal 'Clarisa', @player.name
      assert_equal @deck, @player.deck
    end

    def test_it_has_lost?
      assert_equal false, @player.has_lost?

      @player.deck.remove_card(:diamond, "Queen", 12)
      assert_equal 2, @player.deck.cards.length
      assert_equal false, @player.has_lost?

      @player.deck.remove_card(:spade, "3", 3)
      assert_equal 1, @player.deck.cards.length
 
      assert_equal false, @player.has_lost?

      @player.deck.remove_card(:heart, "Ace", 14)

      assert_equal true, @player.has_lost?
      assert_equal [], @player.deck.cards

    end
end