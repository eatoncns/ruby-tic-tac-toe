require 'human'
require 'board'

describe Human do
  let(:input) { StringIO.new("5\n") }
  let(:output) { StringIO.new }
  let(:player) { Human.new(input, output) }
  let(:board) { Board.new }
  
  describe "#choose_space" do
    it "should display current board state" do
      board.set_mark(1, "X")
      player.choose_space(board)
      board_output = "|---|---|---|\n" +
                     "| X | 2 | 3 |\n" +
                     "|---|---|---|\n" +
                     "| 4 | 5 | 6 |\n" +
                     "|---|---|---|\n" +
                     "| 7 | 8 | 9 |\n" +
                     "|---|---|---|"
      expect(output.string).to include board_output
    end

    it "should prompt for space" do
      player.choose_space(board)
      expect(output.string).to include "Choose space (1-9): "
    end

    context "when input space is valid" do
      it "should return input space" do
        expect(player.choose_space(board)).to eq 5
      end
    end

    ["aofb\n5\n", "\n5\n", "3.5\n5\n", "7haf\n5\n"].each do |invalid_input|
      context "when input space is not valid (#{invalid_input})" do
        it "should prompt again" do
          input = StringIO.new(invalid_input)
          player = Human.new(input, output)
          player.choose_space(board)
          expect(output.string.scan("Choose space").size).to eq 2
        end

        it "should return valid value" do
          input = StringIO.new(invalid_input)
          player = Human.new(input, output)
          expect(player.choose_space(board)).to eq 5
        end
      end
    end
  end
end
