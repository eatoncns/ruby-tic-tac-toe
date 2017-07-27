require 'result'
require 'board'
require 'console'

RSpec.describe "Result.display" do
  let(:console) { instance_double("Console", :puts => nil, :line_break => nil) }
  let(:drawn_board) { board = Board.from_a(["X", "X", "Y",
                                            "Y" ,"Y", "X",
                                            "X", "X", "Y"]) }

  context "when a player has won game" do
    it "congratulates winning player" do
      board = Board.from_a(["X", "X", "X",
                            "Y", "Y", "",
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
      board = Board.new
      expect{Result.display(board, console)}.to raise_error(ArgumentError)
    end
  end

  it "displays final board state" do
    board_output = "|---|---|---|\n" +
                   "| X | X | Y |\n" +
                   "|---|---|---|\n" +
                   "| Y | Y | X |\n" +
                   "|---|---|---|\n" +
                   "| X | X | Y |\n" +
                   "|---|---|---|\n"
    expect(console).to receive(:puts).with(board_output)
    Result.display(drawn_board, console)
  end
end
