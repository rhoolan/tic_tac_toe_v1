require_relative 'board'

class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end


    def get_position
        position = [-1] #set to -1 because .between? wont work with nil class
        board_length = 3

        puts " #{mark}'s turn"
        puts "Please enter a valid position (for example '1 1'): "
        position = gets.chomp.split('')

        #ask for user input until they enter valid input
        until position[0].to_i.between?(0,board_length-1) && position[-1].to_i.between?(0, board_length-1)
            puts "Please enter a valid position (for example '1 1'): "
            position = gets.chomp.split('')
        end

        return position.map { |i| i.to_i }
    end

end