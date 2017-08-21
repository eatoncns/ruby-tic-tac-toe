require 'board_display'
require 'ttt_core'

RSpec.describe "BoardDisplay" do
  it "returns string representation of empty board" do
    board = TttCore::Board.new
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
    board = TttCore::Board.from_a(["X", "", "X",
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

  it "left aligns double digit space indices" do
    board = TttCore::Board.new(4)
    board_output = "|---|---|---|---|\n" +
                   "| 1 | 2 | 3 | 4 |\n" +
                   "|---|---|---|---|\n" +
                   "| 5 | 6 | 7 | 8 |\n" +
                   "|---|---|---|---|\n" +
                   "| 9 |10 |11 |12 |\n" +
                   "|---|---|---|---|\n" +
                   "|13 |14 |15 |16 |\n" +
                   "|---|---|---|---|\n"
    expect(BoardDisplay.as_string(board)).to eq board_output
  end
end
