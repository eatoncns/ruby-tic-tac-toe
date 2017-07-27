class Prompt
  def self.for_int_in_range(console, message, range)
    range_string = "#{range.first}-#{range.last}"
    prompt = "#{message} (#{range_string}): "
    console.print(prompt)
    int = console.get_int
    until range.include?(int)
      console.puts("Enter number in range #{range_string}")
      console.print(prompt)
      int = console.get_int
    end
    console.line_break
    int
  end

  def self.for_string(console, message)
    console.print(message + ": ")
    console.get_string
  end

  def self.for_yes_no(console, question)
    prompt = question + " (y/n): "
    console.print(prompt)
    answer = console.get_string
    until answer == "y" || answer == "n" do
      console.puts("Answer must be y or n")
      console.print(prompt)
      answer = console.get_string
    end
    answer == "y"
  end
  
  def self.play_again?(console)
    answer = self.for_yes_no(console, "Do you want to play another game?")
    console.line_break
    answer
  end
end
