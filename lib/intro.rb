class Intro
  def initialize(console)
    @console = console
  end

  def display
    display_title()
    display_instructions()
  end

  def display_title
    @console.puts("Tic Tac Toe!\n" +
                  "============\n")
  end

  def display_instructions
    @console.puts("Players select spaces to mark each turn. " +
                  "Complete a row, column or diagonal to win!\n")
  end
end
