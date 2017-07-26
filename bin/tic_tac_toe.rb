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
  prompt = Prompt.new(console)
  player_one = Human.new "X"
  player_two = Human.new "Y"
  game = Game.new(board, player_one, player_two)
  until game.game_over?
    game.take_turn
  end
  Result.display(board, console)
  break if !prompt.play_again?
end
