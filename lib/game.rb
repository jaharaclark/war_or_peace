require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require './lib/card_generator.rb'

class Game
    attr_reader :cards, :turn, :counter

    def initialize(file_name)
        @cards = CardGenerator.new(file_name).create_card
        shuffled_cards = @cards.shuffle
        cards1 = shuffled_cards.first(26)
        cards2 = shuffled_cards.last(26)
        deck1 = Deck.new(cards1)
        deck2 = Deck.new(cards2)
        @player1 = Player.new("Megan", deck1)    
        @player2 = Player.new("Aurora", deck2)  
        @counter = 1 
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

    # def play_game
    #     game_over = false
    #     counter = 1
    #     until game_over == true do
    #         if @player1.has_lost? == true || @player2.has_lost? == true
    #             someone_won
    #             game_over = true
    #         elsif counter == 1000000 
    #             game_is_a_draw
    #             game_over = true
    #         else
    #             turn = Turn.new(@player1, @player2)
    #             turn.pile_cards
    #             turn.award_spoils(turn.winner) if turn.winner != "No Winner"
    #             display_winner(turn, counter)
    #             counter += 1
    #         end    
    #     end    
    # end

    def play_game
        until winning_condition_met do
            turn = Turn.new(@player1, @player2)
            turn.type
            turn.pile_cards
            turn.award_spoils(turn.winner) if turn.winner != "No Winner"
            display_winner(turn)
            @counter += 1
        end
        someone_won
    end

    def winning_condition_met
        @player1.has_lost? || @player2.has_lost? || counter == 1000000
    end

    def someone_won
      if @player1.has_lost?
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      elsif @player2.has_lost?
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
        puts "You reached 1,000,000 turns! The game is over. Thanks for playing!"
      end
    end    

    def display_winner(turn)
        case turn.type

        when :mutually_assured_destruction
            puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play."
        when :war
            puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards."
        when :basic
            puts "Turn #{counter}: #{turn.winner.name} won 2 cards."
        end
    end
end


