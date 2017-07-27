require 'human_vs_human'
require 'console'
require 'human'

describe HumanVsHuman do
  before(:each) do
    @console = instance_double("Console", :print => nil, :puts => nil, :line_break => nil)
    allow(@console).to receive(:get_string).and_return("Tyrion", "Cersei")
    @hvh = HumanVsHuman.new(@console)
  end

  it "returns two players" do
    expect(@hvh.configure.size).to eq 2
  end

  it "returns human players" do
    players = @hvh.configure
    expect(players).to all(be_a(Human))
  end
  
  it "returns first player with mark X" do
    player_one, player_two = @hvh.configure
    expect(player_one.mark).to eq "X"
  end

  it "returns second player with mark O" do
    player_one, player_two = @hvh.configure
    expect(player_two.mark).to eq "O"
  end

  it "prompts players for names" do
    ["one", "two"].each do |num|
      prompt = "Enter player #{num} name: "
      expect(@console).to receive(:print).with(prompt).ordered
      expect(@console).to receive(:get_string).ordered
    end
    @hvh.configure
  end

  it "returns player one with input name" do
    player_one, player_two = @hvh.configure
    expect(player_one.name).to eq "Tyrion"
  end
  
  it "returns player two with input name" do
    player_one, player_two = @hvh.configure
    expect(player_two.name).to eq "Cersei"
  end

  context "when player two inputs same name as player one" do
    it "outputs error" do
      allow(@console).to receive(:get_string).and_return("Tyrion", "Tyrion", "Cersei")
      expect(@console).to receive(:puts).with("Players cannot have the same name")
      @hvh.configure
    end

    it "prompts for name again" do
      allow(@console).to receive(:get_string).and_return("Tyrion", "Tyrion", "Cersei")
      expect(@console).to receive(:print).with(/Enter player two/).exactly(2).times
      expect(@console).to receive(:get_string).exactly(3).times
      @hvh.configure
    end
  end
end
