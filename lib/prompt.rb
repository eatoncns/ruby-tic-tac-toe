class Prompt
  def initialize(console)
    @console = console
  end

  def play_again?
    answer = nil
    until answer == "y" || answer == "n" do
      @console.output("Do you want to play another game? (y/n): ")
      answer = @console.get_string
    end
    answer == "y"
  end
end
