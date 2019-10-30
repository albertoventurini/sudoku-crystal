module Sudoku

  class ParseException < Exception
  end

  class Parser

    # Parse a sudoku board from a string. Return a board.
    # The string must contain valid board rows. Each row must be separated by a newline.
    # Blanks are represented by dots.
    # E.g.:
    # .1.2
    # 2..4
    # .3..
    # ....
    def self.parse(board_str, block_size)
      rows = board_str.split('\n')
      board_size = rows.size
      board = Sudoku::Board.new(board_size, block_size)

      rows.each_with_index { |row, y|
        if row.size != board_size
          raise ParseException.new("Invalid row size: #{row.size} for row: #{row}")
        end

        row.each_char_with_index { |c, x|
          case c
          when '.'
            board.put(nil, x, y)
          when .number?
            board.put(c.to_s.to_i, x, y)
          else
            raise ParseException.new("Invalid character: #{c}")
          end
        }
      }

      board
    end
  end
end