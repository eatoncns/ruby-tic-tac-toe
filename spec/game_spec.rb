require 'game'

describe Game do
  before(:each) do
    @board = double(:board)
    @player_one = double(:player_one)
    @player_two = double(:player_two)
    @game = Game.new(@board, @player_one, @player_two)
  end

  describe "#take_turn" do
    context "when called for first time" do
      it "should have player one choose space on board" do
        expect(@player_one).to receive(:choose_space).with(@board)
        @game.take_turn()
      end
    end

    context "when called multiple times" do
      it "should alternate between players" do
        expect(@player_one).to receive(:choose_space).ordered
        expect(@player_two).to receive(:choose_space).ordered
        expect(@player_one).to receive(:choose_space).ordered
        expect(@player_two).to receive(:choose_space).ordered

        4.times { @game.take_turn() }
      end
    end
  end

  describe "#game_over?" do
    context "when board is not in game over state" do
      it "should return false" do
        allow(@board).to receive(:game_over?).and_return(false)
        expect(@game.game_over?).to be false
      end
    end

    context "when board is in game over state" do
      it "should return true" do
        allow(@board).to receive(:game_over?).and_return(true)
        expect(@game.game_over?).to be true
      end
    end
  end
end
