require_relative 'prompt'

class HumanVsComputer
  def initialize(console)
    @console = console
  end

  def configure
    human_name = Prompt.for_string(@console, "Enter player name")
    computer_name = "Doombot"
    human_first = Prompt.for_yes_no(@console, "Do you want to go first?")
    if human_first
      [Human.new("X", human_name, @console), Computer.new("O", computer_name, @console)]
    else
      [Computer.new("X", computer_name, @console), Human.new("O", human_name, @console)]
    end
  end
end
