require 'intro'
require 'console'

describe Intro do
  let(:console) { instance_double("Console", :puts => nil) }
  let(:intro) { Intro.new(console) }

  it "displays title" do
    title_output = "Tic Tac Toe!\n" +
                   "============\n"
    expect(console).to receive(:puts).with(title_output)
    intro.display()
  end

  it "displays instructions" do
    instructions = "Players select spaces to mark each turn. " +
                   "Complete a row, column or diagonal to win!\n"
    expect(console).to receive(:puts).with(instructions)
    intro.display()
  end
end
