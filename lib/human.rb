require_relative 'board_display'
require_relative 'prompt'

class Human
  attr_reader :mark
  attr_reader :name

  def initialize(mark, name, console)
    @mark = mark
    @name = name
    @console = console
    @prompt = Prompt.new(console)
  end 

  def choose_space(board)
    display_board(board)
    get_empty_space(board)
  end

  private
    def display_board(board)
      @console.puts(BoardDisplay.as_string(board))
    end
 
    def get_empty_space(board)
      space = get_space_choice(board.size)
      if board.get_mark(space).empty?
        @console.line_break
        space
      else
        @console.puts("Space #{space} is already taken")
        get_empty_space(board)
      end
    end

    def get_space_choice(max_space)
      @prompt.for_int_in_range("[#{@name}] Choose space", (1..max_space))
    end    
end
