require_relative 'console_computer'
require_relative 'interactive_computer'

class ComputerVsComputer
  def initialize(console)
    @console = console
  end

  def configure
    comp_one = ConsoleComputer.new("X", "Ying", @console)
    comp_two = ConsoleComputer.new("O", "Yang", @console)
    [InteractiveComputer.new(comp_one, @console), InteractiveComputer.new(comp_two, @console)]
  end
end
