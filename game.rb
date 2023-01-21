require_relative 'board'
require_relative 'human_player'
require 'colored2'

class Game 
    attr_reader :board, :current_player, :players

    def initialize(grid_size, players)
        @board = Board.new(grid_size)
        @players = players
    end

    def switch_turn 
        @players.rotate!
    end

    def play
        system("clear")
        while board.empty_positions?
            system("clear")
            board.print_board
            current_player = players[0]
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
puts 'Enter grid size'
grid_size = gets.chomp.to_i

puts 'Enter amount of players'
player_amount = gets.chomp.to_i

players = []
(1..player_amount).each do |i|
    puts "Enter player #{i} mark"
    players << HumanPlayer.new(gets.chomp[0])
end 


new = Game.new(grid_size,players)
new.play