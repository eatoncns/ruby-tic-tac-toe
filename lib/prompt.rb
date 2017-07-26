class Prompt
  def self.play_again?(input = $stdin, output = $stdout)
    output.print("Do you want to play another game? (y/n): ")
    answer = input.gets.chomp
    answer == "y"
  end
end
