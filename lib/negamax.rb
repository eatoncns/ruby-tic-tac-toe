class Negamax
  MAX_VALUE = 100
  
  def self.value_to_mark(mark, board)
    if board.drawn?
      return 0
    end
    winning_mark = board.winning_mark()
    if winning_mark == mark
      MAX_VALUE
    else
      -MAX_VALUE
    end
  end
end
