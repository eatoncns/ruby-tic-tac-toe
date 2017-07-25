class BoardDisplay
  def self.as_string(board)
    display = ""
    divider = build_divider(board.dimension)
    board.space_rows.each do |space_row|
      display << divider
      display << build_row_output(board, space_row)
    end
    display << divider.chomp
  end

  private
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
        row_output << "| #{mark} "
      end
      row_output << "|\n"
    end
end
