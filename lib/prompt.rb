class Prompt
  def self.for_int_in_range(console, message, range)
    int = nil
    until range.include?(int)
      console.print("#{message} (#{range.first}-#{range.last}): ")
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
    answer = nil
    until answer == "y" || answer == "n" do
      console.print("Do you want to play another game? (y/n): ")
      answer = console.get_string
    end
    console.line_break
    answer == "y"
  end
end
