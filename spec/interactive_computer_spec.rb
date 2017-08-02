require 'interactive_computer'
require 'console'
require 'board'

RSpec.describe InteractiveComputer do
  let(:computer) { instance_double("Computer", { :mark => "X", :choose_space => 1 }) }
  let(:console) { instance_double("Console", { :puts => nil, :print => nil, :line_break => nil, :get_string => ""}) }
  let(:interactive_computer) { InteractiveComputer.new(computer, console) }
  let(:board) { Board.new }
  
  describe "#choose_space" do
    it "outputs pre-move board state" do
      board_output = "|---|---|---|\n" +
                     "| 1 | 2 | 3 |\n" +
                     "|---|---|---|\n" +
                     "| 4 | 5 | 6 |\n" +
                     "|---|---|---|\n" +
                     "| 7 | 8 | 9 |\n" +
                     "|---|---|---|\n"
      expect(console).to receive(:puts).with(board_output)
      interactive_computer.choose_space(board)
    end

    it "prompts user to continue" do
      expect(console).to receive(:print).with("Press enter to continue").ordered
      expect(console).to receive(:get_string).ordered
      interactive_computer.choose_space(board)
    end

    it "returns space from wrapped computer" do
      expect(computer).to receive(:choose_space).and_return(5)
      expect(interactive_computer.choose_space(board)).to eq 5
    end
  end

  describe "#mark" do
    it "returns mark from wrapped computer" do
      expect(computer).to receive(:mark).and_return("O")
      expect(interactive_computer.mark).to eq "O"
      
    end
  end
end
