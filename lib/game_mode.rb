require_relative 'prompt'
require_relative 'human_vs_computer'

class GameMode
  HUMAN_VS_COMPUTER = 1
  HUMAN_VS_HUMAN = 2

  def self.select(console)
    console.puts("Game modes:\n" +
                 "  1. Human vs Computer\n" +
                 "  2. Human vs Human\n")
    mode = Prompt.for_int_in_range(console, "Select game mode", (1..2))
    if mode == HUMAN_VS_COMPUTER
      HumanVsComputer.new
    else
      HumanVsHuman.new
    end
  end
end
