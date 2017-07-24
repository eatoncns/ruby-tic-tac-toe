class Board
  attr_reader :size
  
  def initialize(dimension = 3) 
    @dimension = dimension
    @size = dimension*dimension
    @board = Array.new(@size, "")
  end

  def random_space
    (1..@size).to_a.sample
  end

  def set_mark(space, mark)
    validate_space(space)
    @board[space-1] = mark
  end

  def get_mark(space)
    validate_space(space)
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
  
  def rows
    @board.each_slice(@dimension).to_a
  end

  private
    def valid_space(space)
      space >= 1 && space <= @size
    end

    def validate_space(space)
      if !valid_space(space)
        raise(IndexError, "space #{space} out of board bounds: (1..#{@size})")
      end
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
        !line.first.empty? && line.all? { |mark| mark == line.first }
      end
    end

    def all_spaces_taken?
      @board.all? { |mark| !mark.empty? }
    end
end
