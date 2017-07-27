require_relative 'human'

class Players
  def self.select(console)
    name_one, name_two = get_names(console)
    [Human.new("X", name_one, console), Human.new("O", name_two, console)]
  end

  private
    def self.get_names(console)
      name_one = get_name("one", console)
      name_two = get_name("two", console)
      until name_one != name_two do
        console.puts("Players cannot have the same name")
        name_two = get_name("two", console)
      end
      console.line_break
      [name_one, name_two]
    end

    def self.get_name(player_num, console)
      console.print("Enter player #{player_num} name: ")
      console.get_string
    end
end
