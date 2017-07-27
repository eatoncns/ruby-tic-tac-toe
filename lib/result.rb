require_relative 'board_display'

class Result
  def self.display(board, console)
    if !board.game_over?
      raise(ArgumentError, "Board is not in game over state")
    end
    console.puts(BoardDisplay.as_string(board))
    if board.drawn?
      message = "It's a draw. Players are evenly matched"
    else
      winning_mark = board.winning_mark
      message = "#{winning_mark} wins! Congrats #{winning_mark}"
    end
    console.puts(message)
    console.line_break
  end
end
