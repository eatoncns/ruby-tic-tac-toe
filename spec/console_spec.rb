require 'console'

RSpec.describe Console do
  let(:integer_string) { "5" }
  let(:input) { StringIO.new(integer_string + "\n") }
  let(:output) { StringIO.new }
  let(:console) { Console.new(input, output) }

  describe "#output" do
    it "writes input string to output" do
      test_string = "Parzival!"
      console.output(test_string)
      expect(output.string).to eq test_string
    end
  end
  
  describe "#get_string" do
    it "gets string from input" do
      expect(console.get_string).to eq integer_string
    end
  end

  describe "#get_int" do
    it "returns integer from input" do
      expect(console.get_int).to eq 5
    end

    ["abd", "5affd"].each do |input|
      context "when input is non-integer #{input}" do
        it "returns nil" do
          input = StringIO.new(input + "\n")
          console = Console.new(input, output)
          expect(console.get_int).to be nil
        end
      end
    end
  end
end
