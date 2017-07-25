def display_result(board, output)
  winning_mark = board.winning_mark
  output.puts "#{winning_mark} wins! Congrats #{winning_mark}"
end
