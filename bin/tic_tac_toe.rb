#!/usr/bin/ruby

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/human'
require_relative '../lib/result'
require_relative '../lib/console'
require_relative '../lib/prompt'

loop do
  board = Board.new
  console = Console.new
  player_one = Human.new("X", console)
  player_two = Human.new("Y", console)
  game = Game.new(board, player_one, player_two)
  until game.game_over?
    game.take_turn
  end
  Result.display(board, console)
  break if !Prompt.play_again?(console)
end
