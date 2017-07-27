require 'console'

RSpec.describe Console do
  let(:integer_string) { "5" }
  let(:input) { StringIO.new(integer_string + "\n") }
  let(:output) { StringIO.new }
  let(:console) { Console.new(input, output) }

  describe "#print" do
    it "writes input string to output" do
      test_string = "Parzival!"
      console.print(test_string)
      expect(output.string).to eq test_string
    end
  end

  describe "#puts" do
    it "writes input string to output adding newline" do
      test_string = "Parzival!"
      console.puts(test_string)
      expect(output.string).to eq test_string + "\n"
    end

    it "adds newline even if one already present" do
      test_string = "Parzival!\n"
      console.puts(test_string)
      expect(output.string).to eq test_string + "\n"
    end
  end

  describe "#line_break" do
    it "outputs newline" do
      console.line_break
      expect(output.string).to eq "\n"
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
