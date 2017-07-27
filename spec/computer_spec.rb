require 'computer'
require 'board'
require 'console'

RSpec.describe Computer do
  let(:console) { instance_double("Console", :puts => nil, :line_break => nil) }
  let(:random) { instance_double("Random", :rand => 1) }
  let(:computer) { Computer.new("X", "Bran", console, random) }
  let(:board) { Board.from_a(["X", "", "Y",
                              "", "X", "Y",
                              "X", "", ""]) }

  describe "#choose_space" do
    it "selects a random empty space" do
      expect(random).to receive(:rand).with(0..3).and_return(1)
      expect(computer.choose_space(board)).to eq 4
    end

    it "outputs chosen space" do
      expect(console).to receive(:puts).with("[Bran] Chooses space 4")
      computer.choose_space(board)
    end
  end
end
