class Negamax
  MAX_VALUE = 100
  
  def self.calculate(board, nextPlayerMark)
    winning_mark = board.winning_mark()
    if winning_mark == nextPlayerMark
      MAX_VALUE
    else
      -MAX_VALUE
    end
  end
end
