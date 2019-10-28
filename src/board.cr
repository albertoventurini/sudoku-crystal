
module Sudoku

  class Board

    alias Value = Nil | Int8

    enum State
      Valid
      Invalid
    end

    getter grid

    def initialize(@width : Int8, @height : Int8)
      @grid = Array(Value).new(@width * @height, nil)
    end

    def put(value : Value, x, y)
      @grid[y * @width + x] = value
    end

    def get(x, y)
      @grid[y * @width + x]
    end
      
  end

end