require 'player_selection'
require 'console'

describe Players do
  describe ".select" do
    let(:console) { instance_double("Console") }

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
  end
end
