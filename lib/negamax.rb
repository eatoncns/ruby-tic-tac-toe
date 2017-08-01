require_relative 'mark'
require_relative 'board'

class Negamax
  MAX_VALUE = 100
  VALUE_BOUND = MAX_VALUE + 1
  
  def self.value_to_mark(mark, board)
    negamax = Negamax.new(board)
    negamax.value_to_mark_at(mark, 0)
  end
  
  def value_to_mark_at(mark, depth)
    if @board.game_over?
      terminal_value(mark, depth)
    else
      max_next_move_value(mark, depth)
    end
  end

  private
    def initialize(board)
      @board = board
    end

    def terminal_value(mark, depth)
      if @board.drawn?
        return 0
      end
      winning_mark = @board.winning_mark()
      if winning_mark == mark
        return MAX_VALUE - depth
      end
      -MAX_VALUE + depth
    end

    def max_next_move_value(mark, depth)
      max_value = -VALUE_BOUND
      @board.empty_spaces.each do |space|
        move_value = value_of_move(mark, space, depth)
        max_value = [max_value, move_value].max
      end
      max_value
    end

    def value_of_move(mark, space, depth)
      Board.with_move(@board, space, mark) do
        -value_to_mark_at(Mark.opponent(mark), depth+1)   
      end
    end
end
