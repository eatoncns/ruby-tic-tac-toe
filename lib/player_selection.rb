require_relative 'human'

class Players
  def self.select(console)
    [Human.new("X", console), Human.new("Y", console)]
  end
end
