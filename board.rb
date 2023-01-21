class Board
    attr_reader :grid, :turn

    def initialize 
        @grid = Array.new(3) { Array.new(3, '_')}
        @turn = 1
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    #valid input will be [row, col]
    def valid?(position)
        position[0].between?(0,2) && position[1].between?(0,2)
    end

    def empty?(position)
        grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)

        if !valid?(position)
            puts "Not a valid position"
            return false
        end

        if !empty?(position)
            puts "Position is not empty"
            return false
        end

        if turn.odd?
            grid[position[0]][position[1]] = mark
        else
            grid[position[0]][position[1]] = mark
        end
        @turn += 1
    end

    def print_board
        puts '  0 1 2'
        grid.each_with_index do |row, idx1|
            puts "#{idx1.to_s} " + row.join(' ')
        end
    end

    def win_row?(mark)
        grid.each do |row|
            return true if row.all? { |tile| tile == mark}
        end
        return false
    end

    def win_col?(mark)
        grid.transpose.each do |col|
            return true if col.all? { |tile| tile == mark}
        end
        return false
    end

    def win_diag?(mark)
        left_to_right = []
        right_to_left = []

        (0...grid.length).each do |i|
            left_to_right << self[[i,i]]
            right_to_left << self[[i,-(i+1)]]
        end

        if left_to_right.all?(mark) || right_to_left.all?(mark)
            return true 
        else 
            return false 
        end
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diag?(mark)
        false
    end

    def empty_positions?
        grid.each do |row|
            row.each do |tile|
                return true if tile == '_'
            end
        end
        return false
    end
end