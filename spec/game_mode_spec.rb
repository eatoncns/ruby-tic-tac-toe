require 'game_mode'
require 'console'
require 'human_vs_computer'
require 'human_vs_human'
require 'computer_vs_computer'

RSpec.describe GameMode do
  let(:console) { instance_double("Console", { :puts => nil, :print => nil, :get_int => 1, :line_break => nil }) }
  let(:game_mode) { GameMode.new(console) }
  let(:prompt) { "Select game mode (1-4): " }

  it "outputs game mode options" do
    options = "Game modes:\n" +
              "  1. Human vs Computer\n" +
              "  2. Computer vs Human\n" +
              "  3. Human vs Human\n" +
              "  4. Computer vs Computer\n"
    expect(console).to receive(:puts).with(options)
    game_mode.select()
  end

  it "prompts for selection" do
    expect(console).to receive(:print).with(prompt)
    game_mode.select()
  end

  context "when player selects Human vs Computer" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_COMPUTER
      expect(game_mode.select()).to be_a HumanVsComputer
    end

    it "sets configuration so computer plays second" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_COMPUTER
      mode = game_mode.select()
      expect(mode.computer_first?).to be false 
    end
  end

  context "when player selects Computer vs Human" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::COMPUTER_VS_HUMAN
      expect(game_mode.select()).to be_a HumanVsComputer
    end

    it "sets configuration so computer plays first" do
      allow(console).to receive(:get_int).and_return GameMode::COMPUTER_VS_HUMAN
      mode = game_mode.select()
      expect(mode.computer_first?).to be true 
    end
    
  end

  context "when player selects Human vs Human" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_HUMAN
      expect(game_mode.select()).to be_a HumanVsHuman
    end
  end
  
  context "when player selects Computer vs Computer" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::COMPUTER_VS_COMPUTER
      expect(game_mode.select()).to be_a ComputerVsComputer 
    end
  end

  [-1, 0, 5].each do |input|
    context "when input is invalid selection #{input}" do
      it "prompts again" do
        allow(console).to receive(:get_int).and_return(input, 1)
        expect(console).to receive(:print).with(prompt).twice
        game_mode.select()
      end
    end
  end
end
