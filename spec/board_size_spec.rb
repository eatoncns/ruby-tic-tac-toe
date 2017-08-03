require 'board_size'
require 'console'

RSpec.describe BoardSize do
  let(:console) { instance_double("Console", { :puts => nil, :print => nil, :get_int => 1, :line_break => nil }) }
  let(:board_size) { BoardSize.new(console) }

  it "outputs board size options" do
    options = "Board sizes:\n" +
              "  1. 3x3\n" +
              "  2. 4x4\n"
    expect(console).to receive(:puts).with(options)
    board_size.select() 
  end

  it "prompts for selection" do
    prompt = "Select board size (1-2): "
    expect(console).to receive(:print).with(prompt)
    board_size.select()
  end

  context "when player selects 3x3" do
    it "returns board with dimension 3" do
      allow(console).to receive(:get_int).and_return(1)
      board = board_size.select()
      expect(board.dimension).to eq 3
    end
  end
  
  context "when player selects 4x4" do
    it "returns board with dimension 4" do
      allow(console).to receive(:get_int).and_return(2)
      board = board_size.select()
      expect(board.dimension).to eq 4
    end
  end
end
