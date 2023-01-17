require_relative 'board'
require_relative 'human_player'

class Game 
    attr_reader :current_player, :player1, :player2

    def initialize(player1_mark, player2_mark)
        @player1 = player1_mark
        @player2 = player2_mark
        @current_player = player1
    end

    def switch_turn 
        if current_player == player1
            @current_player = player2
        else
            @current_player = player1
        end
    end
end