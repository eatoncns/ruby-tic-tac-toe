require 'board'

RSpec.describe Board do

  let(:board) { Board.new }
  let(:drawn_board) { Board.from_a ["X", "X", "Y",
                                    "X" ,"Y", "X",
                                    "Y", "X", "Y"] }
  let(:in_progress_board) { Board.from_a ["X", "", "Y",
                                          "Y", "", "",
                                          "X", "", ""] }

  describe "#size" do
    context "with default board" do
      it "is 9" do
        expect(board.size).to eq 9
      end
    end
  end
  
  describe "#get_mark" do
    context "with a new board" do
      it "returns empty for all spaces" do
        for space in (1..board.size)
          expect(board.get_mark(space).empty?).to eq true
        end
      end
    end

    context "when #set_mark has been called for space" do
      it "returns the same mark" do
        space = board.random_space
        board.set_mark(space, "X")
        expect(board.get_mark(space)).to eq "X"
      end
    end

    [-3, 0, 10].each do |space|
      context "with invalid space #{space} input" do
        it "raises an IndexError" do
          expect{board.get_mark(space)}.to raise_error(IndexError)
        end
      end
    end
  end

  describe "#set_mark" do
    [-3, 0, 10].each do |space|
      context "with invalid space #{space} input" do
        it "raises an IndexError" do
          expect{board.set_mark(space, "X")}.to raise_error(IndexError)
        end
      end
    end 
  end

  describe "#game_over?" do
    context "with a new board" do
      it "returns false" do
        expect(board.game_over?).to be false
      end
    end

    context "when game is drawn" do
      it "returns true" do
        expect(drawn_board.game_over?).to be true
      end
    end

    context "when game is still in progress" do
      it "returns false" do
        expect(in_progress_board.game_over?).to be false
      end
    end

    [[1, 2, 3], [4, 5, 6], [7, 8, 9],
     [1, 4, 7], [2, 5, 8], [3, 6, 9],
     [1, 5, 9], [3, 5, 7]].each do |line|
      context "when player has taken all of line #{line}" do
        it "returns true" do
          line.each { |space| board.set_mark(space, "X") }
          expect(board.game_over?).to be true
        end
      end
    end
  end

  describe "#get_winning_mark" do
    context "when board has been won by X" do
      it "returns X" do
        board = Board.from_a(["X", "X", "X",
                              "Y", "Y", "",
                               "", "", ""])
        expect(board.winning_mark).to eq "X"
      end
    end

    context "when board has been won by Y" do
      it "returns Y" do
        board = Board.from_a(["Y", "X", "X",
                              "X", "Y", "",
                               "", "", "Y"])
        expect(board.winning_mark).to eq "Y"
      end
    end
  end
end
