require 'human_vs_computer'
require 'console'
require 'human'
require 'computer'

describe HumanVsComputer do
  before(:each) do
    @console = instance_double("Console", :print => nil)
    allow(@console).to receive(:get_string).and_return("Bob", "y")
    @hvc = HumanVsComputer.new(@console)
  end
  
  it "returns two players" do
    expect(@hvc.configure.size).to eq 2
  end
  
  it "asks player for name" do
    expect(@console).to receive(:print).with("Enter player name: ")
    @hvc.configure 
  end

  it "asks player whether they want to go first" do
    expect(@console).to receive(:print).with("Do you want to go first? (y/n): ")
    @hvc.configure
  end

  context "when player wants to go first" do
    it "returns human player first" do
      expect(@hvc.configure[0]).to be_a Human
    end

    it "returns computer player second" do
      expect(@hvc.configure[1]).to be_a Computer
    end

    it "sets human mark to X" do
      expect(@hvc.configure[0].mark).to eq "X"
    end

    it "sets computer mark to O" do
      expect(@hvc.configure[1].mark).to eq "O"
    end

    it "sets human name to the one input" do
      expect(@hvc.configure[0].name).to eq "Bob" 
    end
  end

  context "when player wants to go second" do
    before(:each) do
      allow(@console).to receive(:get_string).and_return("Bob", "n")
    end
    
    it "returns computer player first" do
      expect(@hvc.configure[0]).to be_a Computer 
    end
    
    it "returns human player second" do
      expect(@hvc.configure[1]).to be_a Human
    end

    it "sets computer mark to X" do
      expect(@hvc.configure[0].mark).to eq "X"
    end

    it "sets huamn mark to O" do
      expect(@hvc.configure[1].mark).to eq "O"
    end

    it "sets human name to the one input" do
      expect(@hvc.configure[1].name).to eq "Bob" 
    end
  end
end
