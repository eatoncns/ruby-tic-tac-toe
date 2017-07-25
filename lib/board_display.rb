def board_display(board)
  display = ""
  divider = build_divider(board.dimension)
  board.space_rows.each do |space_row|
    display << divider
    display << build_row_output(board, space_row)
  end
  display << divider.chomp
end

def build_divider(dimension)
  divider = ""
  dimension.times do
    divider << "|---"
  end
  divider << "|\n"
end

def build_row_output(board, space_row)
  row_output = ""
  space_row.each do |space|
    mark = board.get_mark(space)
    mark = if mark.empty? then space.to_s else mark end
    row_output << "| #{mark} "
  end
  row_output << "|\n"
end
