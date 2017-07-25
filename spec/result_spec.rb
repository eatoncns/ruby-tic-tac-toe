require 'result'
require 'board'

describe "Result.display" do
  let(:output) { StringIO.new }
  let(:drawn_board) { board = Board.from_a(["X", "X", "Y",
                                            "Y" ,"Y", "X",
                                            "X", "X", "Y"]) }

  context "when a player has won game" do
    it "congratulates winning player" do
      board = Board.from_a(["X", "X", "X",
                            "Y", "Y", "",
                             "", "", ""])
      Result.display(board, output)
      expect(output.string).to include "X wins! Congrats X\n"
    end
  end

  context "when board is drawn" do
    it "outputs draw message" do
      Result.display(drawn_board, output)
      expect(output.string).to include "It's a draw. Players are evenly matched\n"
    end
  end

  context "when board is on progress" do
    it "raises ArgumentError" do
      board = Board.new
      expect{Result.display(board, output)}.to raise_error(ArgumentError)
    end
  end

  it "displays final board state" do
    board_output = "|---|---|---|\n" +
                   "| X | X | Y |\n" +
                   "|---|---|---|\n" +
                   "| Y | Y | X |\n" +
                   "|---|---|---|\n" +
                   "| X | X | Y |\n" +
                   "|---|---|---|"
    Result.display(drawn_board, output)
    expect(output.string).to include board_output
  end
end
