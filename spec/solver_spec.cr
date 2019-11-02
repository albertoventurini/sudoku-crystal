require "./spec_helper"

describe Sudoku::Parser do

  it "should solve a Sudoku" do
    board_string =
    "8........\n" \
    "..36.....\n" \
    ".7..9.2..\n" \
    ".5...7...\n" \
    "....457..\n" \
    "...1...3.\n" \
    "..1....68\n" \
    "..85...1.\n" \
    ".9....4.."

    board = Sudoku::Parser.parse(board_string, block_size: 3)
    Sudoku::Solver.solve(board)

    board.to_s.should eq \
    "812753649\n" \
    "943682175\n" \
    "675491283\n" \
    "154237896\n" \
    "369845721\n" \
    "287169534\n" \
    "521974368\n" \
    "438526917\n" \
    "796318452"

  end

end