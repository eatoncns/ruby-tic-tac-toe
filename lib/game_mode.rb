require_relative 'prompt'
require_relative 'human_vs_computer'
require_relative 'human_vs_human'

class GameMode
  HUMAN_VS_COMPUTER = 1
  HUMAN_VS_HUMAN = 2

  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
  end

  def select
    mode = select_mode()
    if mode == HUMAN_VS_COMPUTER
      HumanVsComputer.new(@console)
    else
      HumanVsHuman.new(@console)
    end
  end

  private
    def select_mode
      output_options()
      prompt_for_mode()
    end

    def output_options
      @console.puts("Game modes:\n" +
                   "  1. Human vs Computer\n" +
                   "  2. Computer vs Human\n" +
                   "  3. Human vs Human\n")
    end

    def prompt_for_mode
      mode = @prompt.for_int_in_range("Select game mode", (1..3))
      @console.line_break
      mode
    end
end
