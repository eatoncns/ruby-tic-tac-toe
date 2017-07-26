class Console
  def initialize(output = $stdout)
    @output = output
  end

  def output(string)
    @output.print(string)
  end 
end
