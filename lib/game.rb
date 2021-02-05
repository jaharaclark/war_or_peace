require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require './lib/card_generator.rb'

class Game
    attr_reader :cards

    def initialize(file_name)
        @cards = CardGenerator.new(file_name).create_card
        shuffled_cards = @cards.shuffle
        @deck = Deck.new(shuffled_cards)
        # require 'pry'; binding.pry
        @player1 = Player.new("Megan", @deck.cards.first(26))    
        @player2 = Player.new("Aurora", @deck.cards.last(26))   
        @turn = Turn.new(@player1, @player2)

    end

    def greet
        puts "Welcome to War! (or Peace) This game will be played with 52 cards. \n" +
        "The players today are Megan and Aurora. \n" +
        "Type 'GO' to start the game!"
    end 

    def start
        greet
    end   
end