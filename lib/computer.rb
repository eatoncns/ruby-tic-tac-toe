require_relative 'negamax'

class Computer
  attr_reader :mark
  
  def initialize(mark, name, console)
    @mark = mark
    @name = name
    @console = console
  end

  def choose_space(board)
    space = get_space(board)
    output_choice(space)
    space
  end

  private
    Move = Struct.new(:space, :value)

    def get_space(board)
      move_values = board.empty_spaces.collect { |space| Move.new(space, value_of_move(board, space)) }
      best_move = move_values.max { |a, b| a.value <=> b.value }
      best_move.space
    end

    def value_of_move(board, space)
      board.set_mark(space, @mark)
      value = -Negamax.value_to_mark(opponent(@mark), board)
      board.remove_mark(space)
      value
    end 

    def opponent(mark)
      (mark == "X") ? "O" : "X"
    end

    def output_choice(space)
      @console.puts("[#{@name}] Chooses space #{space}")
      @console.line_break
    end
end
