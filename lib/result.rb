def display_result(board, output)
  if board.drawn?
    message = "It's a draw. Players are evenly matched"
  else
    winning_mark = board.winning_mark
    message = "#{winning_mark} wins! Congrats #{winning_mark}"
  end
  output.puts message
end
