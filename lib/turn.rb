class Turn
    attr_reader :player1, :player2, :spoils_of_war
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type 
        # require 'pry'; binding.pry
        if check_length?
            if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank 
                :mutually_assured_destruction
            elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank 
                :basic
            else
                :war
            end
        end 
    end

    def check_length?
        @player1.deck.cards.length >=3 && @player2.deck.cards.length >= 3
    end

    def winner
        result = type
        if result == :basic
           @player1.deck.cards[0].rank > @player2.deck.cards[0].rank ? @player1 : @player2
        elsif result == :war
            if check_length?
              @player1.deck.cards[2].rank > @player2.deck.cards[2].rank ? @player1 : @player2
            end
        else
            "No Winner"
        end
    end

    def pile_cards
        result = type   
        if result == :basic 
           @spoils_of_war << @player1.deck.cards[0]
           @spoils_of_war << @player2.deck.cards[0]

           @player1.deck.remove_card
           @player2.deck.remove_card
        elsif result == :war
           @spoils_of_war << @player1.deck.cards[0]
           @spoils_of_war << @player1.deck.cards[1]
           @spoils_of_war << @player1.deck.cards[2]
           @spoils_of_war << @player2.deck.cards[0]
           @spoils_of_war << @player2.deck.cards[1]
           @spoils_of_war << @player2.deck.cards[2]

           index = 0
            until index > 2
                @player1.deck.remove_card
                @player2.deck.remove_card
                index += 1
            end    
        else
        index = 0
            until index > 2
                @player1.deck.remove_card
                @player2.deck.remove_card
                index += 1
            end
        end
    end

    def award_spoils(winner)
        @spoils_of_war.each do |spoil|
            winner.deck.add_card(spoil)
        end
        @spoils_of_war = []
    end    
end