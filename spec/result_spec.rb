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
end
