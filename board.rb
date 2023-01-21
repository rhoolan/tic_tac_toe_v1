class Board
    attr_reader :grid, :grid_size

    def initialize(grid_size) 
        @grid = Array.new(grid_size) { Array.new(grid_size, '_')}
        @grid_size = grid_size
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    #valid input will be [row, col]
    def valid?(position)
        position[0].between?(0,grid_size) && position[1].between?(0,grid_size)
    end

    def empty?(position)
        grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            grid[position[0]][position[1]] = mark
        end
    end

    def print_board
        (0...grid_size).each do |i|
            if i == 0 
                print "  #{i} "
            else
                print "#{i} "
            end
        end

        puts
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