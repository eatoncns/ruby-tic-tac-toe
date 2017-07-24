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
    winning_line? || all_spaces_taken?
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
      @board.each_slice(@dimension).to_a
    end

    def columns
      rows.transpose
    end

    def column_from_rows(&col_offset)
      (0..@dimension-1).collect { |row| @board[row*@dimension + col_offset.call(row)] }
    end

    def diagonals
      [] << column_from_rows { |row| row } << column_from_rows { |row| @dimension-1-row }
    end

    def lines
      rows + columns + diagonals
    end

    def winning_line?
      lines.any? do |line|
        line.first != :empty && line.all? { |mark| mark == line.first }
      end
    end

    def all_spaces_taken?
      @board.all? { |mark| mark != :empty }
    end
end
