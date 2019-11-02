module Sudoku
  class Solver

    def self.solve(board)
      solve_rec(board, find_next_nil(board, 0))
    end

    # Simple solver with backtracking
    private def self.solve_rec(board, index)
      if board.complete?
        true
      else
        coords = index_to_coordinates(board, index)
        x = coords[:x]
        y = coords[:y]

        result = (1..board.size).any? { |v|
          board.valid?(v, x, y) && begin
            board.put(v, x, y)
            solve_rec(board, find_next_nil(board, index))
          end
        }

        if !result
          board.put(nil, x, y)
        end

        result
      end
    end

    private def self.find_next_nil(board, index)
      max = (board.size ** 2) - 1

      new_index = (index..max).find(-1) { |i|
        coords = index_to_coordinates(board, i)
        board.get(coords[:x], coords[:y]) == nil
      }

      new_index
    end

    private def self.coordinates_to_index(board, x, y)
      y * board.size + x
    end

    private def self.index_to_coordinates(board, index : Int32)
      { x: index % board.size, y: index // board.size }
    end

  end
end