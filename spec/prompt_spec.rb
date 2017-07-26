require 'prompt'

RSpec.describe Prompt do
  describe ".play_again?" do
    let(:yes_answer) { "y\n" }
    let(:input) { StringIO.new(yes_answer) }
    let(:output) { StringIO.new }
    
    it "outputs question" do
      Prompt.play_again?(input, output)
      expect(output.string).to include "Do you want to play another game? (y/n): "
    end

    context "when player answers y" do
      it "returns true" do
        expect(Prompt.play_again?(input, output)).to be true
      end
    end

    context "when player answers n" do
      it "returns false" do
        input = StringIO.new("n\n")
        expect(Prompt.play_again?(input, output)).to be false
      end
    end

    ["alfda", "1", "yes"].each do |answer|
      context "when player gives invalid answer #{answer}" do
        it "outputs question again" do
          input = StringIO.new(answer + "\n" + yes_answer)
          Prompt.play_again?(input, output)
          times_asked = output.string.scan("Do you want to play another game? (y/n): ").size
          expect(times_asked).to eq 2
        end

        it "returns eventual valid answer" do
          input = StringIO.new(answer + "\n" + yes_answer)
          expect(Prompt.play_again?(input, output)).to be true
        end
      end
    end
  end
end
