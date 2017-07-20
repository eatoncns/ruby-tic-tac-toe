class Board
  def initialize
    @board = Array.new(9)
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
