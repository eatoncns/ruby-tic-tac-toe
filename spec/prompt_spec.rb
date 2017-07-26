require 'prompt'

describe Prompt do
  describe ".play_again?" do
    let(:input) { StringIO.new("y\n") }
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
  end
end
