require 'result'
require 'console'
require 'ttt_core'

RSpec.describe "Result.display" do
  let(:console) { instance_double("Console", :puts => nil, :line_break => nil) }
  let(:drawn_board) { board = TttCore::Board.from_a(["X", "X", "O",
                                                     "O" ,"O", "X",
                                                     "X", "X", "O"]) }

  context "when a player has won game" do
    it "congratulates winning player" do
      board = TttCore::Board.from_a(["X", "X", "X",
                                     "O", "O", "",
                                     "", "", ""])
      expect(console).to receive(:puts).with("X wins! Congrats X")
      Result.display(board, console)
    end
  end

  context "when board is drawn" do
    it "outputs draw message" do
      expect(console).to receive(:puts).with("It's a draw. Players are evenly matched")
      Result.display(drawn_board, console)
    end
  end

  context "when board is on progress" do
    it "raises ArgumentError" do
      board = TttCore::Board.new
      expect{Result.display(board, console)}.to raise_error(ArgumentError)
    end
  end

  it "displays final board state" do
    board_output = "|---|---|---|\n" +
                   "| X | X | O |\n" +
                   "|---|---|---|\n" +
                   "| O | O | X |\n" +
                   "|---|---|---|\n" +
                   "| X | X | O |\n" +
                   "|---|---|---|\n"
    expect(console).to receive(:puts).with(board_output)
    Result.display(drawn_board, console)
  end
end
