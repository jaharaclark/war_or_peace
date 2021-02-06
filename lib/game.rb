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
    
    def start
        greet
    end 

    def greet
        puts "Welcome to War! (or Peace) This game will be played with 52 cards. \n" +
        "The players today are Megan and Aurora. \n" +
        "Type 'GO' to start the game! \n" +
        "------------------------------------------------------------------"
        
        check_for_GO
    end 
    
    def check_for_GO
     counter = 0
        while counter < 4 
            start_command = gets.chomp
            counter += 1
            if counter == 3
                puts "Incorrect command entered too many times. Please try again later."
                break
            elsif start_command == "GO"
                play_game
                break
            else
                puts "Oh no! That's not the right command! \n" +
                "Please type 'GO' to start the game! \n"  +
                "------------------------------------------------------------------"
            end  
        end
    end   

    def play_game

        # counter = 1
        # counter += 1
        # check is has lost true?
        # if has lost == true
        #     print the winner in the CLI, 
        #     tell players the game is over
        # elsif counter == 1,000,000 
        #     the game is over
        #     DRAW is printed to CLI
        # else counter < 1,000,000
        #     fire the turn functions (i thin there are 4)    
        #     print "Turn #{counter number}" : "turn type" "who won" "what happened to the cards"
        #      counter += 1
        # end    
    end
end



# Turn 1: Megan won 2 cards
# Turn 2: WAR - Aurora won 6 cards
# Turn 3: *mutually assured destruction* 6 cards removed from play
# ...
# ...
# ...
# Turn 9324: Aurora won 2 cards
# *~*~*~* Aurora has won the game! *~*~*~*