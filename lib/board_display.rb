class BoardDisplay
  def self.as_string(board)
    display = ""
    divider = build_divider(board.dimension)
    space_rows(board).each do |space_row|
      display << divider
      display << build_row_output(board, space_row)
    end
    display << divider
  end

  private
    def self.space_rows(board)
      (1..board.size).each_slice(board.dimension)
    end

    def self.build_divider(dimension)
      divider = ""
      dimension.times do
        divider << "|---"
      end
      divider << "|\n"
    end

    def self.build_row_output(board, space_row)
      row_output = ""
      space_row.each do |space|
        mark = board.get_mark(space)
        mark = if mark.empty? then space.to_s else mark end
        row_output << build_cell(mark)
      end
      row_output << "|\n"
    end

    def self.build_cell(mark)
      cell = "|"
      if needs_centring(mark)
        cell << " "
      end
      cell << "#{mark} "
    end

    def self.needs_centring(mark)
      mark.length == 1
    end
end
