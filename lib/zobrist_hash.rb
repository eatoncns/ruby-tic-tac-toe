class ZobristHash
  def initialize(bit_strings)
    @bit_strings = bit_strings
    @mark_index = bit_strings.length / 2
    @hash = 0
  end

  def get
    @hash 
  end

  def update(space, mark)
    @hash = @hash ^ @bit_strings[index_for(space ,mark)]
  end

  private
    def index_for(space, mark)
      mark_modifier = (mark == "X") ? 0 : 1
      mark_modifier*@mark_index + space-1 
    end
end
