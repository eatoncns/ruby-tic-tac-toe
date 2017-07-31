require_relative 'prompt'
require_relative 'human'
require_relative 'computer'

class HumanVsComputer
  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
  end

  def configure
    human_name = @prompt.for_string("Enter player name")
    computer_name = "Doombot"
    human_first = @prompt.for_yes_no("Do you want to go first?")
    @console.line_break
    if human_first
      [Human.new("X", human_name, @console), Computer.new("O", computer_name, @console)]
    else
      [Computer.new("X", computer_name, @console), Human.new("O", human_name, @console)]
    end
  end
end
