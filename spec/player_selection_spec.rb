require 'player_selection'
require 'console'

describe Players do
  describe ".select" do
    before(:each) do
      @console = instance_double("Console", :print => nil, :puts => nil, :line_break => nil)
      allow(@console).to receive(:get_string).and_return("Tyrion", "Cersei")
    end

    it "returns two players" do
      expect(Players.select(@console).size).to eq 2
    end

    it "returns human players" do
      players = Players.select(@console)
      expect(players).to all(be_a(Human))
    end

    it "returns first player with mark X" do
      player_one, player_two = Players.select(@console)
      expect(player_one.mark).to eq "X"
    end

    it "returns second player with mark Y" do
      player_one, player_two = Players.select(@console)
      expect(player_two.mark).to eq "Y"
    end

    it "prompts players for names" do
      ["one", "two"].each do |num|
        prompt = "Enter player #{num} name: "
        expect(@console).to receive(:print).with(prompt).ordered
        expect(@console).to receive(:get_string).ordered
      end
      Players.select(@console)
    end

    it "returns player one with input name" do
      player_one, player_two = Players.select(@console)
      expect(player_one.name).to eq "Tyrion"
    end
    
    it "returns player two with input name" do
      player_one, player_two = Players.select(@console)
      expect(player_two.name).to eq "Cersei"
    end

    context "when player two inputs same name as player one" do
      it "outputs error" do
        allow(@console).to receive(:get_string).and_return("Tyrion", "Tyrion", "Cersei")
        expect(@console).to receive(:puts).with("Players cannot have the same name")
        Players.select(@console)
      end

      it "prompts for name again" do
        allow(@console).to receive(:get_string).and_return("Tyrion", "Tyrion", "Cersei")
        expect(@console).to receive(:print).with(/Enter player two/).exactly(2).times
        expect(@console).to receive(:get_string).exactly(3).times
        Players.select(@console)
      end
    end
  end
end
