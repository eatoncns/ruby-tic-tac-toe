require 'result'
require 'board'

describe "display_result" do
  let(:output) { StringIO.new }

  context "when a player has won game" do
    it "congratulates winning player" do
      board = Board.from_a(["X", "X", "X",
                            "Y", "Y", "",
                             "", "", ""])
      display_result(board, output)
      expect(output.string).to include "X wins! Congrats X\n"
    end
  end

  context "when board is drawn" do
    it "outputs draw message" do
      board = Board.from_a(["X", "X", "Y",
                            "Y" ,"Y", "X",
                            "X", "X", "Y"])
      display_result(board, output)
      expect(output.string).to include "It's a draw. Players are evenly matched\n"
    end
  end

  context "when board is on progress" do
    it "raises ArgumentError" do
      board = Board.new
      expect{display_result(board, output)}.to raise_error(ArgumentError)
    end
  end
end
