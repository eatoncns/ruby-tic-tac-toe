require_relative 'prompt'

class HumanVsHuman
  def initialize(console)
    @console = console
    @prompt = Prompt.new(console)
  end

  def configure
    name_one, name_two = get_names
    [Human.new("X", name_one, @console), Human.new("O", name_two, @console)]
  end
  
  private
    def get_names
      name_one = get_name("one")
      name_two = get_name("two")
      until name_one != name_two do
        @console.puts("Players cannot have the same name")
        name_two = get_name("two")
      end
      @console.line_break
      [name_one, name_two]
    end

    def get_name(player_num)
      @prompt.for_string("Enter player #{player_num} name")
    end
end
