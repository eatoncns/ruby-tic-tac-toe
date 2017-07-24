class Board
  attr_reader :all_spaces
  attr_reader :rows
  
  def initialize(dimension = 3) 
    @dimension = dimension
    num_spaces = dimension*dimension
    @all_spaces = (1..num_spaces)
    @board = Array.new(num_spaces, :empty)
  end

  def random_space
    all_spaces.to_a.sample
  end

  def set_mark(space, mark)
    @board[space-1] = mark
  end

  def get_mark(space)
    @board[space-1]
  end

  def game_over?
    winning_row? || all_spaces_taken?
  end
  
  def self.from_a(marks)
    board = Board.new
    marks.each_with_index do |mark, index|
      space = index + 1
      board.set_mark(space, mark)
    end
    board
  end

  private
    def rows
      @board.each_slice(@dimension)
    end

    def winning_row?
      rows.any? do |row|
        first_mark = row[0]
        first_mark != :empty && row.all? { |mark| mark == first_mark }
      end
    end

    def all_spaces_taken?
      @board.all? { |mark| mark != :empty }
    end
end
