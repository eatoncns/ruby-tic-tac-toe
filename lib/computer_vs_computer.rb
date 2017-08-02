require_relative 'computer'
require_relative 'interactive_computer'

class ComputerVsComputer
  def initialize(console)
    @console = console
  end

  def configure
    comp_one = Computer.new("X", "Ying", @console)
    comp_two = Computer.new("O", "Yang", @console)
    [InteractiveComputer.new(comp_one, @console), InteractiveComputer.new(comp_two, @console)]
  end
end
