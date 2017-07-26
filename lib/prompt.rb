class Prompt
  def self.play_again?(console)
    answer = nil
    until answer == "y" || answer == "n" do
      console.output("Do you want to play another game? (y/n): ")
      answer = console.get_string
    end
    answer == "y"
  end
end
