class Board
    attr_reader :grid

    def initialize 
        @grid = Array.new(3) { Array.new(3, '_')}
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
        raise "Not a valid position" if !valid?(position)
        raise "Position is not empty" if !empty?(position)
        grid[position[0]][position[1]] = mark
    end

    def print_board
        puts grid.map { |row| row.join(' ')}
    end

    def win_row?(mark)
        return true if grid.each { |x| x.all? { |tile| tile == mark}}
    end

    def win_col?(mark)
        return true if grid.transpose.each { |x| x.all? { |tile| tile == mark}}
    end

    def win_diag?(mark)
        left_to_right = []
        right_to_left = []

        (0...grid.length).each do |i|
            left_to_right << self[[i,i]]
            right_to_left << self[[i,-(i+1)]]
        end

        return true if left_to_right.all?(mark) || right_to_left.all?(mark)

    end


end