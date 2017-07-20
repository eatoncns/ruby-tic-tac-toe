require 'board'
require 'space'

describe Board do

  let(:board) { Board.new }

  describe "#get_mark" do
    context "with a new board" do
      it "should return nil for all spaces" do
        for space in Space.all
          expect(board.get_mark(space)).to be_nil
        end
      end
    end
  end
end
