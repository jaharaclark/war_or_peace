require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'

class GameTest < Minitest::Test
    
  def test_it_exists_and_has_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)    
    player2 = Player.new("Aurora", deck2)    
    game = Game.new('./data/cards.txt')  

    assert_instance_of Game, game
  end
end
