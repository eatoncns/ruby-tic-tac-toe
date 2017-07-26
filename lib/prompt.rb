class Prompt
  def self.play_again?(input = $stdin, output = $stdout)
    answer = nil
    until answer == "y" || answer == "n" do
      output.print("Do you want to play another game? (y/n): ")
      answer = input.gets.chomp
    end
    answer == "y"
  end
end
