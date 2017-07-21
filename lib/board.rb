class Board
  attr_reader :all_spaces
  attr_reader :rows
  
  def initialize(dimension = 3) 
    @num_spaces = dimension*dimension
    @all_spaces = (1..@num_spaces)
    @rows = @all_spaces.each_slice(dimension)
    @board = Array.new(@num_spaces, :empty)
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
    def winning_row?
      rows.any? do |row|
        marks = row.collect { |space| get_mark(space) }
        player_marks = marks.select { |mark| mark != :empty }
        player_marks.uniq.count == 1
      end
    end

    def all_spaces_taken?
      @board.all? { |mark| mark != :empty }
    end
end
