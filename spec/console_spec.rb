require 'console'

RSpec.describe Console do
  let(:output) { StringIO.new }
  let(:console) { Console.new(output) }

  describe "#output" do
    it "writes input string to output" do
      test_string = "Parzival!"
      console.output(test_string)
      expect(output.string).to eq test_string
    end
  end
end
