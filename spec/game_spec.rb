require 'game'
require 'board'

describe Game do
  before(:each) do
    @board = Board.empty
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
  end 
end
