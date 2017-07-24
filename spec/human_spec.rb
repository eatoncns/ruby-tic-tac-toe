require 'human'
require 'board'

describe Human do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:player) { Human.new(input, output) }
  let(:board) { Board.new }
  
  describe "#choose_space" do
    it "should prompt for space" do
      player.choose_space(board)
      expect(output.string).to eq "Choose space (1-9): "
    end

  end
end
