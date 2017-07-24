class Human
  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
  end 

  def choose_space(board)
    display_board(board)
    prompt_for_space(board.size)
    get_chosen_space
  end

  private
    def display_board(board)
      divider = build_divider(board.dimension)
      board.space_rows.each do |space_row|
        @output.puts divider
        @output.puts build_row_output(board, space_row)
      end
      @output.puts divider
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

    def prompt_for_space(max_space)
      @output.print "Choose space (1-#{max_space}): "
    end

    def get_chosen_space
      @input.gets.chomp.to_i
    end
end
