class Console
  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
  end

  def output(string)
    @output.print(string)
  end

  def get_string
    @input.gets.chomp
  end

  def get_int
    input_string = get_string
    input_string[/^\d+$/] && input_string.to_i
  end
end
