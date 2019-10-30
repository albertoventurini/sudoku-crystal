
module Sudoku

  class BoardException < Exception
  end

  class Board

    alias Value = Nil | Int32

    @grid : Array(Array(Value))
    getter grid
    
    getter size
    getter block_size

    def initialize(@size : Int32, @block_size : Int32)
      if !@size.divisible_by?(@block_size)
        raise BoardException.new("Invalid block size: #{@block_size} for board size: #{@size}")
      end
      @grid = Array(Array(Value)).new(@size) { Array(Value).new(@size, nil) }
    end

    def put(value : Value, x, y)
      @grid[y][x] = value
    end

    def get(x, y)
      @grid[y][x]
    end

    def valid?(value : Value, x, y)
      if value == nil
        true
      else
        extract_row(y).all? { |i| i != value } &&
        extract_column(x).all? { |i| i != value } &&
        extract_block(x, y).all? { |i| i.all? { |j| j != value } }
      end
    end

    def extract_row(y)
      @grid[y]
    end

    def extract_column(x)
      (0..@size - 1).map { |i| get(x, i) }
    end

    def extract_block(x, y)
      block_start_x = x - (x % @block_size)
      block_start_y = y - (y % @block_size)

      (block_start_y..block_start_y + @block_size - 1).map { |j|
        (block_start_x..block_start_x + @block_size - 1).map { |i|
          get(i, j)
        }
      }
    end
      
  end

end