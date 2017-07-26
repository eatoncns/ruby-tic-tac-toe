require_relative 'human'

class Players
  def self.select(console)
    console.output("Enter player one name: ")
    name_one = console.get_string
    console.output("Enter player two name: ")
    name_two = console.get_string
    [Human.new("X", name_one, console), Human.new("Y", name_two, console)]
  end
end
