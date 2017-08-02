require_relative 'board_display'

class InteractiveComputer
  def initialize(computer, console)
    @computer = computer
    @console = console
  end

  def mark
    @computer.mark
  end

  def choose_space(board)
    display_board(board)
    wait_for_user()
    @computer.choose_space(board)
  end

  def display_board(board)
    @console.puts(BoardDisplay.as_string(board))
  end

  def wait_for_user
    @console.print("Press enter to continue")
    @console.get_string()
    @console.line_break
  end
end
