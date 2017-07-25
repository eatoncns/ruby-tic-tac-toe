require_relative 'board_display'

class Human
  attr_reader :mark

  def initialize(mark, input = $stdin, output = $stdout)
    @mark = mark
    @input = input
    @output = output
  end 

  def choose_space(board)
    display_board(board)
    get_empty_space(board)
  end


  private
    def display_board(board)
      @output.puts board_display(board)
    end
 
    def get_empty_space(board)
      space = get_space_choice(board.size)
      if board.get_mark(space).empty?
        space
      else
        get_space_choice(board.size)
      end
    end

    def get_space_choice(max_space)
      prompt_for_space(max_space)
      input_string = @input.gets.chomp
      begin
        space = Integer(input_string)
        if space >= 1 && space <= max_space
          return space
        end
      rescue ArgumentError, TypeError
      end
      get_space_choice(max_space)
    end
    
    def prompt_for_space(max_space)
      @output.print "Choose space (1-#{max_space}): "
    end
end
