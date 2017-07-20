class Game
  def initialize(board, player_one, player_two)
    @board = board
    @current_player = player_one
  end
  
  def take_turn
    @current_player.choose_space(@board)
  end
end
