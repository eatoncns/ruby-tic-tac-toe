#!/usr/bin/ruby

require_relative '../lib/intro.rb'
require_relative '../lib/result'
require_relative '../lib/console'
require_relative '../lib/prompt'
require_relative '../lib/game_mode'
require_relative '../lib/board_size.rb'
require 'ttt_core'

console = Console.new
intro = Intro.new(console)
intro.display()
game_mode = GameMode.new(console)
board_size = BoardSize.new(console)
loop do
  mode = game_mode.select()
  board = board_size.select()
  player_one, player_two = mode.configure()
  TttCore::Game.play(board, player_one, player_two)
  Result.display(board, console)
  break if !Prompt.play_again?(console)
end
