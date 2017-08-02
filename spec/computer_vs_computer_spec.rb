require 'computer_vs_computer'
require 'interactive_computer'

RSpec.describe ComputerVsComputer do
  let(:console) { Object.new }
  let(:cvc) { ComputerVsComputer.new(console) }

  describe "#configure" do
    it "returns two interactive computer players" do
      players = cvc.configure()
      expect(players.size).to eq 2
      expect(players[0]).to be_a InteractiveComputer
      expect(players[1]).to be_a InteractiveComputer 
    end

    it "returns player with mark X first" do
      player_one, _ = cvc.configure()
      expect(player_one.mark).to eq "X"
    end

    it "returns player with mark O second" do
      _, player_two = cvc.configure()
      expect(player_two.mark).to eq "O"
    end
  end
end
