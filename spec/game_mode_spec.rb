require 'game_mode'
require 'console'
require 'human_vs_computer'
require 'human_vs_human'

RSpec.describe GameMode do
  let(:console) { instance_double("Console", { :puts => nil, :print => nil, :get_int => 1, :line_break => nil }) }
  let(:game_mode) { GameMode.new(console) }
  let(:prompt) { "Select game mode (1-2): " }

  it "outputs game mode options" do
    options = "Game modes:\n" +
              "  1. Human vs Computer\n" +
              "  2. Computer vs Human\n" +
              "  3. Human vs Human\n"
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
  end

  context "when player selects Human vs Human" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_HUMAN
      expect(game_mode.select()).to be_a HumanVsHuman
    end
  end

  [-1, 0, 3].each do |input|
    context "when input is invalid selection #{input}" do
      it "prompts again" do
        allow(console).to receive(:get_int).and_return(input, 1)
        expect(console).to receive(:print).with(prompt).twice
        game_mode.select()
      end
    end
  end
end
