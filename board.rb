class Board
    attr_reader :grid

    def initialize 
        @grid = Array.new(3) { Array.new(3, '_')}
    end

    #valid input will be [row, col]
    def valid?(position)
        position[0].between?(0,2) && position[1].between?(0,2)
    end

    def empty?(position)
        grid[position[0]][position[1]] == '_'
    end
end