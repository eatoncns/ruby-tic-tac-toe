require 'computer'
require 'board'
require 'console'

RSpec.describe Computer do
  let(:console) { instance_double("Console", :puts => nil, :line_break => nil) }
  let(:computer) { Computer.new("X", "Bran", console) }

  describe "#choose_space" do
    it "outputs chosen space" do
      board = Board.from_a(["X", "O", "O",
                             "", "X", "X",
                            "O", "X", "O"])
      expect(console).to receive(:puts).with("[Bran] Chooses space 4")
      computer.choose_space(board)
    end

    it "chooses winning space when possible" do
      board = Board.from_a(["X", "", "X",
                            "O", "", "",
                            "O", "", ""])
      expect(computer.choose_space(board)).to eq 2
    end

    it "blocks opponent win" do
      board = Board.from_a(["O", "X", "X",
                            "O", "", "",
                             "", "", ""])
      expect(computer.choose_space(board)).to eq 7
    end

    it "blocks a fork" do
      board = Board.from_a(["O", "", "",
                            "", "X", "",
                            "", "", "O"])
      expect(computer.choose_space(board)).to satisfy("be an edge space") { |space| space.even? }
    end

    it "creates fork" do
      board = Board.from_a(["O", "", "",
                            "", "X", "",
                            "", "O", "X"])
      expect(computer.choose_space(board)).to eq 3 
    end
  end
end
