require_relative 'board_display'
require_relative 'prompt'

class Human
  attr_reader :mark
  attr_reader :name

  def initialize(mark, name, console)
    @mark = mark
    @name = name
    @console = console
  end 

  def choose_space(board)
    display_board(board)
    get_empty_space(board)
  end

  private
    def display_board(board)
      @console.output BoardDisplay.as_string(board)
    end
 
    def get_empty_space(board)
      space = get_space_choice(board.size)
      if board.get_mark(space).empty?
        space
      else
        get_space_choice(board.size)
      end
    end

    def get_space_choice(max_space)
      Prompt.for_int_in_range(@console, "Choose space", (1..max_space))
    end    
end
