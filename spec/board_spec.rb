require 'board'

describe Board do

  let(:board) { Board.new }
  let(:drawn_board) { Board.from_a [:X, :X, :Y,
                                    :X ,:Y, :X,
                                    :Y, :X, :Y] }

  describe "#get_mark" do
    context "with a new board" do
      it "should return :empty for all spaces" do
        for space in board.all_spaces
          expect(board.get_mark(space)).to eq :empty
        end
      end
    end

    context "when #set_mark has been called for space" do
      it "should return the same mark" do
        space = board.random_space
        board.set_mark(space, :X)
        expect(board.get_mark(space)).to eq :X
      end
    end
  end

  describe "#game_over?" do
    context "with a new board" do
      it "should return false" do
        expect(board.game_over?).to be false
      end
    end

    context "when game is drawn" do
      it "will return true" do
        expect(drawn_board.game_over?).to be true
      end
    end

    [[1, 2, 3], [4, 5, 6], [7, 8, 9]].each do |row|
      context "when player has taken all of row #{row}" do
        it "will return true" do
          row.each { |space| board.set_mark(space, :X) }
          expect(board.game_over?).to be true
        end
      end
    end
  end
end
