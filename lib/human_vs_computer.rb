require_relative 'prompt'
require_relative 'human'
require_relative 'console_computer'

class HumanVsComputer
  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
    @computer_first = false
  end

  def computer_plays_first
    @computer_first = true 
  end

  def computer_first?
    @computer_first
  end

  def configure
    human_name, computer_name = get_names()
    create_players(human_name, computer_name)
  end

  private
    def get_names
      human_name = @prompt.for_string("Enter player name")
      @console.line_break
      computer_name = "Doombot"
      [human_name, computer_name]
    end

    def create_players(human_name, computer_name)
      if @computer_first
        [ConsoleComputer.new("X", computer_name, @console), Human.new("O", human_name, @console)]
      else
        [Human.new("X", human_name, @console), ConsoleComputer.new("O", computer_name, @console)]
      end
    end
end
