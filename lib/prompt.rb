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
