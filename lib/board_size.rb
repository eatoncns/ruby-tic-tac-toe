require_relative 'prompt'
require_relative 'board'

class BoardSize
  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
  end

  def select
    size = get_size()
    Board.new(size)
  end

  def get_size
    @console.puts("Board sizes:\n" + 
                  "  1. 3x3\n" +
                  "  2. 4x4\n")
    selection = @prompt.for_int_in_range("Select board size", (1..2))
    @console.line_break()
    (selection == 1) ? 3 : 4
  end
end
