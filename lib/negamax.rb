require_relative 'mark'
require_relative 'board'

class Negamax
  MAX_VALUE = 100
  VALUE_BOUND = MAX_VALUE + 1
  
  def self.value_to_mark(mark, board)
    negamax = Negamax.new(board)
    negamax.value_to_mark_at(mark, 0, -VALUE_BOUND, VALUE_BOUND)
  end
  
  def value_to_mark_at(mark, depth, alpha, beta)
    if @board.game_over?
      terminal_value(mark, depth)
    else
      max_next_move_value(mark, depth, alpha, beta)
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

    def max_next_move_value(mark, depth, alpha, beta)
      max_value = -VALUE_BOUND
      @board.empty_spaces.each do |space|
        move_value = value_of_move(mark, space, depth, alpha, beta)
        max_value = [max_value, move_value].max
        alpha = [alpha, move_value].max
        if alpha >= beta
          break
        end
      end
      max_value
    end

    def value_of_move(mark, space, depth, alpha, beta)
      Board.with_move(@board, space, mark) do
        -value_to_mark_at(Mark.opponent(mark), depth+1, -beta, -alpha)   
      end
    end
end
