require_relative 'board_display'

class Result
  def self.display(board, console)
    check_game_is_over(board)
    display_board(board, console)
    display_result_message(board, console)
    console.line_break
  end

  private
    def self.check_game_is_over(board)
      if !board.game_over?
        raise(ArgumentError, "Board is not in game over state")
      end
    end

    def self.display_board(board, console)
      console.puts(BoardDisplay.as_string(board))
    end

    def self.display_result_message(board, console)
      if board.drawn?
        message = "It's a draw. Players are evenly matched"
      else
        winning_mark = board.winning_mark
        message = "#{winning_mark} wins! Congrats #{winning_mark}"
      end
      console.puts(message)
    end
end
