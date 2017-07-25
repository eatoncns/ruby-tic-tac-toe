require_relative 'board_display'

class Result
  def self.display(board, output = $stdout)
    if !board.game_over?
      raise(ArgumentError, "Board is not in game over state")
    end
    output.puts BoardDisplay.as_string(board)
    if board.drawn?
      message = "It's a draw. Players are evenly matched"
    else
      winning_mark = board.winning_mark
      message = "#{winning_mark} wins! Congrats #{winning_mark}"
    end
    output.puts message
  end
end
