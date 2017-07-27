require 'board_display'
require 'board'

RSpec.describe "BoardDisplay" do
  it "returns string representation of empty board" do
    board = Board.new
    board_output = "|---|---|---|\n" +
                   "| 1 | 2 | 3 |\n" +
                   "|---|---|---|\n" +
                   "| 4 | 5 | 6 |\n" +
                   "|---|---|---|\n" +
                   "| 7 | 8 | 9 |\n" +
                   "|---|---|---|\n"
    expect(BoardDisplay.as_string(board)).to eq board_output
  end

  it "returns string representation of populated board" do
    board = Board.from_a(["X", "", "X",
                          "O", "", "",
                          "", "O", ""])
    board_output = "|---|---|---|\n" +
                   "| X | 2 | X |\n" +
                   "|---|---|---|\n" +
                   "| O | 5 | 6 |\n" +
                   "|---|---|---|\n" +
                   "| 7 | O | 9 |\n" +
                   "|---|---|---|\n"
    expect(BoardDisplay.as_string(board)).to eq board_output
  end
end
