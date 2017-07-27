#!/usr/bin/ruby

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/human'
require_relative '../lib/result'
require_relative '../lib/console'
require_relative '../lib/prompt'
require_relative '../lib/game_mode'

console = Console.new
loop do
  board = Board.new
  players = GameMode.select(console)
  player_one, player_two = players.configure 
  game = Game.new(board, player_one, player_two)
  until game.game_over?
    game.take_turn
  end
  Result.display(board, console)
  break if !Prompt.play_again?(console)
end
