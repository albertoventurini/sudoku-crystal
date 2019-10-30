require "./spec_helper"

describe Sudoku::Parser do

  it "should parse an empty board" do
    board_string = "....\n....\n....\n...."
    board = Sudoku::Parser.parse(board_string, block_size: 2)
    board.size.should eq 4
    board.block_size.should eq 2

    (0..3).each { |x|
      (0..3).each { |y|
        board.get(x, y).should eq nil
      }
    }
  end

  it "should raise an exception if number of rows and colums is different" do
    expect_raises(Sudoku::ParseException) do
      Sudoku::Parser.parse("....\n....", block_size: 2)
    end
  end

  it "should put numbers correctly on the board" do
    board_string = "1...\n.2..\n..3.\n...4"
    board = Sudoku::Parser.parse(board_string, block_size: 2)

    board.get(0,0).should eq 1
    board.get(1,1).should eq 2
    board.get(2,2).should eq 3
    board.get(3,3).should eq 4
  end

  it "should raise an exception if a cell contains a character that is not a number or a dot" do
    expect_raises(Sudoku::ParseException) do
      Sudoku::Parser.parse(".A..\n....\n....\n....", block_size: 2)
    end
  end

  it "should parse 9x9 boards correctly" do
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

    board.get(0,0).should eq 8
    board.get(2,1).should eq 3
    board.get(3,1).should eq 6
    board.get(1,2).should eq 7
    board.get(4,2).should eq 9
    board.get(8,8).should eq nil
  end
  
end