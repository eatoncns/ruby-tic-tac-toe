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
      rows = board.rows
      divider = build_divider(rows.length)
      board.rows.each_with_index do |row, row_index|
        @output.puts divider
        @output.puts build_row_output(row, row_index)
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

    def build_row_output(row, row_index)
      row_output = ""
      row.each_with_index do |mark, col_index|
        mark = if mark.empty?
                 then space_number(row.length, row_index, col_index).to_s
               else 
                 mark 
               end
        row_output << "| #{mark} "
      end
      row_output << "|\n"
    end

    def space_number(dimension, row_index, col_index)
      dimension*row_index + col_index + 1
    end
    
    def prompt_for_space(max_space)
      @output.print "Choose space (1-#{max_space}): "
    end

    def get_chosen_space
      @input.gets.chomp.to_i
    end
end
