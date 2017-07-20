class Game
  def initialize(board, player_one, player_two)
    @board = board
    @current_player = player_one
    @next_player = player_two
  end
  
  def take_turn
    @current_player.choose_space(@board)
    @current_player, @next_player = @next_player, @current_player
  end
end
