require 'human'
require 'board'

describe Human do
  let(:player) { Human.new }
  let(:board) { Board.new }
  
  describe "#choose_space" do
    it "should prompt for space" do
      expect{player.choose_space(board)}.to output("Choose space (1-9): ").to_stdout
    end
  end
end
