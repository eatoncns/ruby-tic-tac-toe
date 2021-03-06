require 'human_vs_computer'
require 'console'
require 'human'
require 'console_computer'

describe HumanVsComputer do
  before(:each) do
    @console = instance_double("Console", :print => nil, :line_break => nil)
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

  context "when not configured for computer to go first" do
    it "returns human player first" do
      expect(@hvc.configure[0]).to be_a Human
    end

    it "returns computer player second" do
      expect(@hvc.configure[1]).to be_a ConsoleComputer
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

  context "when configured for computer to go first" do
    before(:each) do
      @hvc.computer_plays_first()
    end
    
    it "returns computer player first" do
      expect(@hvc.configure[0]).to be_a ConsoleComputer 
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
