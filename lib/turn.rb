class Turn
    attr_reader :player1, :player2, :spoils_of_war
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank 
            :mutually_assured_destruction
        elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank 
            :basic
        else
            :war
        end
    end

    def winner
        result = type
        if result == :basic
           @player1.deck.cards[0].rank > @player2.deck.cards[0].rank ? @player1 : @player2
        elsif result == :war
            # require 'pry'; binding.pry
            @player1.deck.cards[2].rank > @player2.deck.cards[2].rank ? @player1 : @player2
        else
            "No Winner"
        end
    end

    def pile_cards
        result = type   
        if result == :basic 
           player1_cards = @player1.deck.cards[0]
           player2_cards = @player2.deck.cards[0]
           
           @spoils_of_war << player1_cards
           @spoils_of_war << player2_cards

           @player1.deck.cards.delete(player1_cards)
           @player2.deck.cards.delete(player2_cards)
        elsif result == :war
           @spoils_of_war << @player1.deck.cards[0]
           @spoils_of_war << @player1.deck.cards[1]
           @spoils_of_war << @player1.deck.cards[2]
           @spoils_of_war << @player2.deck.cards[0]
           @spoils_of_war << @player2.deck.cards[1]
           @spoils_of_war << @player2.deck.cards[2]

           index = 0
            until index > 2
                @player1.deck.cards.shift
                @player2.deck.cards.shift
                index += 1
            end    
        else
        index = 0
            until index > 2
                @player1.deck.cards.shift
                @player2.deck.cards.shift
                index += 1
            end
        end
    end

    def award_spoils(winner)
        @spoils_of_war.each do |spoil|
            winner.deck.cards << spoil
        end
        @spoils_of_war = []
    end    
end