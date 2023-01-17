require_relative 'board'
require_relative 'human_player'

class Game 

    def initialize(player1_mark, player2_mark)
        @player1 = player1_mark
        @player2 = player1_mark
        @current_player = @player1

    end
end