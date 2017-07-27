require 'prompt'
require 'console'

RSpec.describe Prompt do

  describe ".for_int_in_range" do
    let(:console) { instance_double("Console", { :get_int => 3, :print => nil, :puts => nil, :line_break => nil}) }
    let(:message) { "Choose space" }
    let(:range) { (1..9) }
    let(:expected_message) { "Choose space (1-9): " }

    it "outputs message" do
      expect(console).to receive(:print).with(expected_message)
      Prompt.for_int_in_range(console, message, range)
    end

    context "when player enters integer in range" do
      it "returns input integer" do
        expect(Prompt.for_int_in_range(console, message, range)).to eq 3
      end
    end

    context "when player enters integer outside range" do
      it "outputs message again" do
        allow(console).to receive(:get_int).and_return(10, 5)
        expect(console).to receive(:print).with(expected_message).twice
        Prompt.for_int_in_range(console, message, range)
      end
    end
  end

  describe ".for_string" do
    let(:console) { instance_double("Console", { :print => nil, :get_string => "blah" }) }

    it "outputs message" do
      expect(console).to receive(:print).with("Input a thing: ")
      Prompt.for_string(console, "Input a thing")
    end

    it "returns input string" do
      expect(Prompt.for_string(console, "Whatever")).to eq "blah"
    end
  end

  describe ".for_yes_no" do
    let(:console) { instance_double("Console", { :print => nil, :puts => nil, :get_string => "y" }) }
    
    it "outputs question with added options" do
      expect(console).to receive(:print).with("go? (y/n): ")
      Prompt.for_yes_no(console, "go?")
    end

    context "when player answers y" do
      it "returns true" do
        expect(Prompt.for_yes_no(console, "go?")).to be true
      end
    end

    context "when player answers n" do
      it "returns false" do
        allow(console).to receive(:get_string).and_return("n")
        expect(Prompt.for_yes_no(console, "go?")).to be false
      end
    end

    ["1", "yes", "agr"].each do |input|
      context "when player enters invalid answer #{input}" do
        it "outputs error" do
          allow(console).to receive(:get_string).and_return(input, "y")
          expect(console).to receive(:puts).with("Answer must be y or n")
          Prompt.for_yes_no(console, "go?")
        end

        it "prompts again" do
          allow(console).to receive(:get_string).and_return(input, "y")
          expect(console).to receive(:print).with(/go?/).exactly(2).times
          Prompt.for_yes_no(console, "go?")
        end
      end
    end
  end

  describe ".play_again?" do
    let(:yes_answer) { "y" }
    let(:console) { instance_double("Console", { :get_string => yes_answer, :print => nil, :puts => nil, :line_break => nil}) }

    it "outputs question" do
      expect(console).to receive(:print).with("Do you want to play another game? (y/n): ")
      Prompt.play_again?(console)
    end

    context "when player answers y" do
      it "returns true" do
        expect(Prompt.play_again?(console)).to be true
      end
    end

    context "when player answers n" do
      it "returns false" do
        allow(console).to receive(:get_string).and_return("n")
        expect(Prompt.play_again?(console)).to be false
      end
    end

    ["alfda", "1", "yes"].each do |answer|
      context "when player gives invalid answer #{answer}" do
        it "outputs question again" do
          allow(console).to receive(:get_string).and_return(answer, yes_answer)
          Prompt.play_again?(console)
          expect(console).to have_received(:print).twice
        end

        it "returns eventual valid answer" do
          allow(console).to receive(:get_string).and_return(answer, yes_answer)
          expect(Prompt.play_again?(console)).to be true
        end
      end
    end
  end
end
