require 'human'
require 'board'

RSpec.describe Human do
  let(:console) { instance_double("Console", { :get_int => 5, :puts => nil, :print => nil, :line_break => nil}) }
  let(:player) { Human.new("X", "Tyrion", console) }
  let(:board) { Board.new }
  let(:expected_prompt) { "[Tyrion] Choose space (1-9): " }

  describe "#choose_space" do
    it "displays current board state" do
      board.set_mark(1, "X")
      board_output = "|---|---|---|\n" +
                     "| X | 2 | 3 |\n" +
                     "|---|---|---|\n" +
                     "| 4 | 5 | 6 |\n" +
                     "|---|---|---|\n" +
                     "| 7 | 8 | 9 |\n" +
                     "|---|---|---|\n"
      expect(console).to receive(:puts).with(board_output)
      player.choose_space(board)
    end

    it "prompts for space" do
      expect(console).to receive(:print).with(expected_prompt)
      player.choose_space(board)
    end

    context "when input space is valid" do
      it "returns input space" do
        expect(player.choose_space(board)).to eq 5
      end
    end

    context "when input space is not in range" do
      it "prompts again" do
        allow(console).to receive(:get_int).and_return(-1, 0, 10, 5)
        expect(console).to receive(:print).with(expected_prompt).exactly(4).times
        player.choose_space(board)
      end

      it "returns eventually input valid value" do
        allow(console).to receive(:get_int).and_return(-1, 0, 10, 5)
        expect(player.choose_space(board)).to eq 5
      end
    end

    context "when input space is already taken" do
      it "outputs error" do
        board.set_mark(1, "X")
        allow(console).to receive(:get_int).and_return(1, 5)
        expect(console).to receive(:puts).with("Space 1 is already taken")
        player.choose_space(board)
      end
      
      it "prompts again until valid" do
        board.set_mark(1, "X")
        allow(console).to receive(:get_int).and_return(1, 1, 5)
        expect(console).to receive(:print).with(expected_prompt).exactly(3).times
        player.choose_space(board)
      end

      it "returns eventually input valid value" do
        board.set_mark(1, "X")
        allow(console).to receive(:get_int).and_return(1, 5)
        expect(player.choose_space(board)).to eq 5
      end
    end
  end
end
