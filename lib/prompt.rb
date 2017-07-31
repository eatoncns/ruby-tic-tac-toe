class Prompt
  def initialize(console)
    @console = console
  end

  def for_int_in_range(message, range)
    range_string = "#{range.first}-#{range.last}"
    prompt = "#{message} (#{range_string})"
    int = for_int(prompt)
    until range.include?(int)
      @console.puts("Enter number in range #{range_string}")
      int = for_int(prompt)
    end
    int
  end

  def for_string(message)
    for_input(message)
    @console.get_string
  end

  def for_yes_no(question)
    prompt = question + " (y/n)"
    answer = for_string(prompt)
    until answer == "y" || answer == "n" do
      @console.puts("Answer must be y or n")
      answer = for_string(prompt)
    end
    answer == "y"
  end
  
  def self.play_again?(console)
    prompt = Prompt.new(console)
    answer = prompt.for_yes_no("Do you want to play another game?")
    console.line_break
    answer
  end

  private
    def for_int(message)
      for_input(message)
      @console.get_int
    end
    
    def for_input(message)
      @console.print(message + ": ")
    end
end
