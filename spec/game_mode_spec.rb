require 'game_mode'
require 'console'
require 'human_vs_computer'
require 'human_vs_human'

RSpec.describe GameMode do
  let(:console) { instance_double("Console", { :puts => nil, :print => nil, :get_int => 1, :line_break => nil }) }
  let(:prompt) { "Select game mode (1-2): " }

  it "outputs game mode options" do
    options = "Game modes:\n" +
              "  1. Human vs Computer\n" +
              "  2. Human vs Human\n"
    expect(console).to receive(:puts).with(options)
    GameMode.select(console)
  end

  it "prompts for selection" do
    expect(console).to receive(:print).with(prompt)
    GameMode.select(console)
  end

  context "when player selects Human vs Computer" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_COMPUTER
      expect(GameMode.select(console)).to be_a HumanVsComputer
    end
  end

  context "when player selects Human vs Human" do
    it "returns appropriate configuration class" do
      allow(console).to receive(:get_int).and_return GameMode::HUMAN_VS_HUMAN
      expect(GameMode.select(console)).to be_a HumanVsHuman
    end
  end

  [-1, 0, 3].each do |input|
    context "when input is invalid selection #{input}" do
      it "prompts again" do
        allow(console).to receive(:get_int).and_return(input, 1)
        expect(console).to receive(:print).with(prompt).twice
        GameMode.select(console)
      end
    end
  end
end
