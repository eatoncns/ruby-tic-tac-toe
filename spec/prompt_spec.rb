require 'prompt'
require 'console'

RSpec.describe Prompt do
  describe ".play_again?" do
    let(:yes_answer) { "y" }
    let(:console) { instance_double("Console", { :get_string => yes_answer, :output => nil }) }
    let(:prompt) { Prompt.new(console) }

    it "outputs question" do
      expect(console).to receive(:output).with("Do you want to play another game? (y/n): ")
      prompt.play_again?
    end

    context "when player answers y" do
      it "returns true" do
        expect(prompt.play_again?).to be true
      end
    end

    context "when player answers n" do
      it "returns false" do
        allow(console).to receive(:get_string).and_return("n")
        expect(prompt.play_again?).to be false
      end
    end

    ["alfda", "1", "yes"].each do |answer|
      context "when player gives invalid answer #{answer}" do
        it "outputs question again" do
          allow(console).to receive(:get_string).and_return(answer, yes_answer)
          prompt.play_again?
          expect(console).to have_received(:output).twice
        end

        it "returns eventual valid answer" do
          allow(console).to receive(:get_string).and_return(answer, yes_answer)
          expect(prompt.play_again?).to be true
        end
      end
    end
  end
end
