require_relative 'board'
require_relative 'human_player'
require 'colored2'

class Game 
    attr_reader :board, :current_player, :player1, :player2

    def initialize(player1_mark, player2_mark)
        @board = Board.new
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

    def play
        system("clear")
        while board.empty_positions?
            system("clear")
            board.print_board
            pos = current_player.get_position


            if board.valid?(pos) && board.empty?(pos)
                board.place_mark(pos, current_player.mark)

                if board.win?(current_player.mark)
                    system("clear")
                    board.print_board
                    puts 'You won!'
                    return
                else
                    switch_turn
                end
            end
            board.print_board
        end
        puts "Draw"
    end

end

player1 = nil
player2 = nil

system("clear")
puts 'Enter player one mark'
player1 = HumanPlayer.new(gets.chomp.red)
puts 'Enter player two mark'
player2 = HumanPlayer.new(gets.chomp.blue)

new = Game.new(player1, player2)
new.play