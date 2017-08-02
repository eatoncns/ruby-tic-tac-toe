require_relative 'prompt'
require_relative 'human_vs_computer'
require_relative 'human_vs_human'
require_relative 'computer_vs_computer'

class GameMode
  HUMAN_VS_COMPUTER = 1
  COMPUTER_VS_HUMAN = 2
  HUMAN_VS_HUMAN = 3
  COMPUTER_VS_COMPUTER = 4

  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
  end

  def select
    mode = select_mode()
    case mode
    when HUMAN_VS_COMPUTER
      HumanVsComputer.new(@console)
    when COMPUTER_VS_HUMAN
      mode_config = HumanVsComputer.new(@console)
      mode_config.computer_plays_first()
      mode_config
    when HUMAN_VS_HUMAN
      HumanVsHuman.new(@console) 
    else
      ComputerVsComputer.new(@console)
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
                   "  3. Human vs Human\n" +
                   "  4. Computer vs Computer\n")
    end

    def prompt_for_mode
      mode = @prompt.for_int_in_range("Select game mode", (1..4))
      @console.line_break
      mode
    end
end
