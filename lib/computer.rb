require_relative 'negamax'
require_relative 'mark'
require_relative 'transposition_table'

class Computer
  attr_reader :mark
  
  def initialize(mark, name, console)
    @mark = mark
    @name = name
    @console = console
    @transposition_table = TranspositionTable.new
  end

  def choose_space(board)
    space = get_space(board)
    output_choice(space)
    space
  end

  private
    Move = Struct.new(:space, :value)

    def get_space(board)
      if opening_moves?(board)
        return first_available_space(board)
      end
      strategic_space(board)
    end

    def opening_moves?(board)
      (board.dimension > 3) && (board.spaces_marked <= board.dimension)
    end

    def first_available_space(board)
      board.empty_spaces().first()
    end

    def strategic_space(board)
      moves = board.empty_spaces.collect { |space| Move.new(space, value_of_move(board, space)) }
      best_move = moves.max { |a, b| a.value <=> b.value }
      best_move.space
    end

    def value_of_move(board, space)
      Board.with_move(board, space, @mark) do
        -Negamax.value_to_mark(Mark.opponent(@mark), board, @transposition_table)
      end
    end 
    
    def output_choice(space)
      @console.puts("[#{@name}] Chooses space #{space}")
      @console.line_break
    end
end
