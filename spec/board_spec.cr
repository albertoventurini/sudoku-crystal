require "./spec_helper"

describe Sudoku::Board do

  it "initialized grid with nil values" do
    board = Sudoku::Board.new(9, 3)
    board.get(0, 0).should eq nil
  end

  it "raises exception if board size is not divisible by block size" do
    expect_raises(Sudoku::BoardException) do
      Sudoku::Board.new(9, 4)
    end
  end

  it "puts numbers correctly" do
    board = Sudoku::Board.new(9, 3)
    board.put(1, 0, 0)
    board.get(0, 0).should eq 1
  end

  it "extracts rows correctly" do
    row = 1
    board = Sudoku::Board.new(4, 2)
    (0..3).each { |i| board.put(i, i, row) }
    board.extract_row(row).should eq [0, 1, 2, 3]
  end

  it "extracts columns correctly" do
    column = 2
    board = Sudoku::Board.new(4, 2)
    (0..3).each { |i| board.put(i, column, i) }
    board.extract_column(column).should eq [0, 1, 2, 3]
  end

  it "extracts blocks correctly" do
    board = Sudoku::Board.new(4, 2)
    board.put(42, 2, 0)
    board.put(43, 3, 0)
    board.put(44, 2, 1)
    board.put(45, 3, 1)
    board.extract_block(3, 1).should eq [[42, 43], [44, 45]]
  end

end
