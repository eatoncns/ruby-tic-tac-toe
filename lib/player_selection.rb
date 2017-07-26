require_relative 'human'

class Players
  def self.select(console)
    name_one, name_two = get_names(console)
    [Human.new("X", name_one, console), Human.new("Y", name_two, console)]
  end

  private
    def self.get_names(console)
      name_one = get_name("one", console)
      name_two = get_name("two", console)
      until name_one != name_two do
        console.output("Players cannot have the same name\n")
        name_two = get_name("two", console)
      end
      [name_one, name_two]
    end

    def self.get_name(player_num, console)
      console.output("Enter player #{player_num} name: ")
      console.get_string
    end
end
