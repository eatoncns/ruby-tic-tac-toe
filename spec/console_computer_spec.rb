require 'console_computer'
require 'console'
require 'ttt_core'

RSpec.describe ConsoleComputer do
  let(:console) { instance_double("Console", :puts => nil, :line_break => nil) }
  let(:computer) { ConsoleComputer.new("X", "Bran", console) }

  describe "#choose_space" do
    it "outputs chosen space" do
      board = TttCore::Board.from_a(["X", "O", "O",
                                     "", "X", "X",
                                     "O", "X", "O"])
      expect(console).to receive(:puts).with("[Bran] Chooses space 4")
      computer.choose_space(board)
    end

    it "returns chosen space" do
      board = TttCore::Board.from_a(["X", "O", "O",
                                     "", "X", "X",
                                     "O", "X", "O"])
      expect(computer.choose_space(board)).to eq 4
    end
  end
end
