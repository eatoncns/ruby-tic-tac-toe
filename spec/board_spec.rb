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

    [-3, 0, 10].each do |space|
      context "with invalid space #{space} input" do
        it "should raise an IndexError" do
          expect{board.get_mark(space)}.to raise_error(IndexError)
        end
      end
    end
  end

  describe "#set_mark" do
    [-3, 0, 10].each do |space|
      context "with invalid space #{space} input" do
        it "should raise an IndexError" do
          expect{board.set_mark(space, :X)}.to raise_error(IndexError)
        end
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

    [[1, 2, 3], [4, 5, 6], [7, 8, 9],
     [1, 4, 7], [2, 5, 8], [3, 6, 9],
     [1, 5, 9], [3, 5, 7]].each do |line|
      context "when player has taken all of line #{line}" do
        it "will return true" do
          line.each { |space| board.set_mark(space, :X) }
          expect(board.game_over?).to be true
        end
      end
    end
  end
end
