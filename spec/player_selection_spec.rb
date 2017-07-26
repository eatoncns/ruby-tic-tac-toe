require 'player_selection'
require 'console'

describe Players do
  describe ".select" do
    let(:console) { instance_double("Console", { :output => nil, :get_string => "" }) }

    it "returns two players" do
      expect(Players.select(console).size).to eq 2
    end

    it "returns human players" do
      players = Players.select(console)
      expect(players).to all(be_a(Human))
    end

    it "returns first player with mark X" do
      player_one, player_two = Players.select(console)
      expect(player_one.mark).to eq "X"
    end

    it "returns second player with mark Y" do
      player_one, player_two = Players.select(console)
      expect(player_two.mark).to eq "Y"
    end

    it "prompts players for names" do
      ["one", "two"].each do |num|
        prompt = "Enter player #{num} name: "
        expect(console).to receive(:output).with(prompt).ordered
        expect(console).to receive(:get_string).ordered
      end
      Players.select(console)
    end

    it "returns player one with input name" do
      allow(console).to receive(:get_string).and_return("Tyrion", "Cersei")
      player_one, player_two = Players.select(console)
      expect(player_one.name).to eq "Tyrion"
    end
    
    it "returns player two with input name" do
      allow(console).to receive(:get_string).and_return("Tyrion", "Cersei")
      player_one, player_two = Players.select(console)
      expect(player_two.name).to eq "Cersei"
    end
  end
end
