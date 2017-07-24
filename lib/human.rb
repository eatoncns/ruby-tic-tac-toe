class Human
  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
  end 

  def choose_space(board)
    @output << "Choose space (1-#{board.all_spaces.last}): "
    @input.gets.chomp.to_i
  end
end
