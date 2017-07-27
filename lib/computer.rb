class Computer
  def initialize(mark, name, console, random = Random.new)
    @mark = mark
    @name = name
    @console = console
    @random = random
  end

  def choose_space(board)
    space = get_space(board)
    output_choice(space)
    space
  end

  private
    def get_space(board)
      empty_spaces = board.empty_spaces
      random_index = @random.rand(0..empty_spaces.length-1)
      empty_spaces[random_index]
    end

    def output_choice(space)
      @console.puts("[#{@name}] Chooses space #{space}")
      @console.line_break
    end
end
