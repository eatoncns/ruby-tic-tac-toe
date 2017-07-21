class Board
  def initialize(dimension = 3) 
    @num_spaces = dimension*dimension
    @board = Array.new(@num_spaces)
  end

  def all_spaces
    (1..@num_spaces).to_a
  end

  def random_space
    all_spaces.sample
  end

  def set_mark(space, mark)
    @board[space-1] = mark
  end

  def get_mark(space)
    @board[space-1]
  end

  def game_over?
    nil
  end
end
