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

    context "when #set_mark has been called for space" do
      it "should return the same mark" do
        board.set_mark(Space.one, "X")
        expect(board.get_mark(Space.one)).to eq "X"
      end
    end
  end
end
