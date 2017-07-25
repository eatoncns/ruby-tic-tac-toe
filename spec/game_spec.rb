require 'game'
require 'board'
require 'human'

RSpec.describe Game do
  before(:each) do
    @board = Board.new
    @player_one = instance_double("Human", {:mark => "X", :choose_space => @board.random_space})
    @player_two = instance_double("Human", {:mark => "Y", :choose_space => @board.random_space})
    @game = Game.new(@board, @player_one, @player_two)
  end

  describe "#take_turn" do
    context "when called for first time" do
      it "has player one choose space on board" do
        expect(@player_one).to receive(:choose_space).with(@board)
        @game.take_turn()
      end
    end

    context "when called multiple times" do
      it "alternates between players" do
        expect(@player_one).to receive(:choose_space).ordered
        expect(@player_two).to receive(:choose_space).ordered
        expect(@player_one).to receive(:choose_space).ordered
        expect(@player_two).to receive(:choose_space).ordered

        4.times { @game.take_turn() }
      end
    end

    it "sets mark in chosen space on board" do
      space = @board.random_space
      allow(@player_one).to receive(:choose_space).and_return(space)
      @game.take_turn()
      expect(@board.get_mark(space)).to eq @player_one.mark
    end
  end

  describe "#game_over?" do
    context "when board is not in game over state" do
      it "returns false" do
        expect(@game.game_over?).to be false
      end
    end

    context "when board is in game over state" do
      it "returns true" do
        board = Board.from_a(["X", "X", "Y",
                              "Y" ,"Y", "X",
                              "X", "X", "Y"])
        @game = Game.new(board, @player_one, @player_two)
        expect(@game.game_over?).to be true
      end
    end
  end
end
