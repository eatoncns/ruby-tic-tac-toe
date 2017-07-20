class Game
  def initialize(board, player_one, player_two)
    @board = board
    @current_player = player_one
    @next_player = player_two
  end
  
  def take_turn
    space = @current_player.choose_space(@board)
    @board.set_mark(space, @current_player.mark)
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over?
    @board.game_over?
  end
end
