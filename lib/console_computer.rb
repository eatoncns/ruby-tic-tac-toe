require 'ttt_core'

class ConsoleComputer
  
  def initialize(mark, name, console)
    @computer = TttCore::Computer.new(mark)
    @name = name
    @console = console
  end

  def choose_space(board)
    space = @computer.choose_space(board)
    output_choice(space)
    space
  end

  def mark
    @computer.mark
  end

  private
    def output_choice(space)
      @console.puts("[#{@name}] Chooses space #{space}")
      @console.line_break
    end
end
