class Negamax
  MAX_VALUE = 100
  VALUE_BOUND = MAX_VALUE + 1
  
  def self.value_to_mark(mark, board)
    value_to_mark_at(mark, board, 0)
  end

  private
    def self.value_to_mark_at(mark, board, depth)
      if board.game_over?
        terminal_value(mark, board, depth)
      else
        max_next_move_value(mark, board, depth)
      end
    end

    def self.terminal_value(mark, board, depth)
      if board.drawn?
        return 0
      end
      winning_mark = board.winning_mark()
      if winning_mark == mark
        return MAX_VALUE - depth
      end
      -MAX_VALUE + depth
    end

    def self.max_next_move_value(mark, board, depth)
      max_value = -VALUE_BOUND
      board.empty_spaces.each do |space|
        move_value = value_of_move(mark, board, space, depth)
        max_value = [max_value, move_value].max
      end
      max_value
    end

    def self.value_of_move(mark, board, space, depth)
      board.set_mark(space, mark)
      value = -value_to_mark_at(opponent(mark), board, depth+1)
      board.set_mark(space, "")
      value
    end

    def self.opponent(mark)
      (mark == "X") ? "O" : "X"
    end
end
