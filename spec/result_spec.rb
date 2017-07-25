require 'result'
require 'board'

describe "display_result" do
  let(:output) { StringIO.new }
  let(:board) { instance_double("Board") }

  context "when a player has won game" do
    it "congratulates winning player" do
      allow(board).to receive(:winning_mark).and_return("X")
      display_result(board, output)
      expect(output.string).to include "X wins! Congrats X\n"
    end
  end
end
