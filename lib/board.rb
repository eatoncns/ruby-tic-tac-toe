class Board
  attr_reader :all_spaces
  
  def initialize(dimension = 3) 
    @num_spaces = dimension*dimension
    @all_spaces = (1..@num_spaces).to_a
    @board = Array.new(@num_spaces, :empty)
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
    @board.all? { |mark| mark != :empty }
  end
  
  def self.from_a(marks)
    board = Board.new
    marks.each_with_index do |mark, index|
      space = index + 1
      board.set_mark(space, mark)
    end
    board
  end
end
