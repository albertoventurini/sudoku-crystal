require "./spec_helper"

describe Sudoku::Board do

  it "initialized grid with nil values" do
    board = Sudoku::Board.new(8, 8)
    board.get(0, 0).should eq nil
  end

  it "puts numbers correctly" do
    board = Sudoku::Board.new(8, 8)
    board.put(1, 0, 0)
    board.get(0, 0).should eq 1
  end

end
