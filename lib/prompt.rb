class Prompt
  def self.for_int_in_range(console, message, range)
    range_string = "#{range.first}-#{range.last}"
    prompt = "#{message} (#{range_string})"
    int = self.for_int(console, prompt)
    until range.include?(int)
      console.puts("Enter number in range #{range_string}")
      int = self.for_int(console, prompt)
    end
    console.line_break
    int
  end

  def self.for_string(console, message)
    self.for_input(console, message)
    console.get_string
  end

  def self.for_yes_no(console, question)
    prompt = question + " (y/n)"
    answer = self.for_string(console, prompt)
    until answer == "y" || answer == "n" do
      console.puts("Answer must be y or n")
      answer = self.for_string(console, prompt)
    end
    answer == "y"
  end
  
  def self.play_again?(console)
    answer = self.for_yes_no(console, "Do you want to play another game?")
    console.line_break
    answer
  end

  private
    def self.for_int(console, message)
      self.for_input(console, message)
      console.get_int
    end
    
    def self.for_input(console, message)
      console.print(message + ": ")
    end
end
