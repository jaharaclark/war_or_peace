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
        if self.type == :basic
           @player1.deck.cards[0].rank > @player2.deck.cards[0].rank ? @player1 : @player2
        elsif self.type == :war
            @player1.deck.cards[2].rank > @player2.deck.cards[2].rank ? @player1 : @player2
        else
            "No Winner"
        end
    end

    def pile_cards
        if self.type == :basic 
           player1_cards = @player1.deck.cards[0]
           player2_cards = @player2.deck.cards[0]
           
           @spoils_of_war << player1_cards
           @spoils_of_war << player2_cards

           @player1.deck.cards.delete(player1_cards)
           @player2.deck.cards.delete(player2_cards)
        elsif self.type == :war
           player1_cards = @player1.deck.cards[0..2]
           player2_cards = @player2.deck.cards[0..2]

           @spoils_of_war << player1_cards
           @spoils_of_war << player2_cards

           @player1.deck.cards.delete(player1_cards)
           @player2.deck.cards.delete(player2_cards)
        else
           player1_cards = @player1.deck.cards[0..2]
           player2_cards = @player2.deck.cards[0..2]

           @player1.deck.cards.delete(player1_cards)
           @player2.deck.cards.delete(player2_cards)
        end
    end

    def award_spoils(winner)
        @spoils_of_war.each do |spoil|
            winner.deck.cards << spoil
        end
        @spoils_of_war = []
    end    
end