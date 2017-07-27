class Console
  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
  end

  def print(string)
    @output.print(string)
  end

  def puts(string)
    @output.print(string + "\n")
  end

  def line_break
    @output.puts
  end

  def get_string
    @input.gets.chomp
  end

  def get_int
    input_string = get_string
    input_string[/^\d+$/] && input_string.to_i
  end
end
