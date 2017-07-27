class HumanVsComputer
  def initialize(console)
    @console = console
  end

  def configure
    @console.print("Enter player name: ")
    human_name = @console.get_string
    computer_name = "Doombot"
    @console.print("Do you want to go first? (y/n): ")
    answer = @console.get_string
    if answer == "y"
      [Human.new("X", human_name, @console), Computer.new("O", computer_name, @console)]
    else
      [Computer.new("X", computer_name, @console), Human.new("O", human_name, @console)]
    end
  end
end
