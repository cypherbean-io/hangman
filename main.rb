# frozen_string_literal: true

require_relative 'lib/game_state'
require_relative 'lib/word_bank'
require_relative 'lib/display'
require_relative 'lib/game'

if File.exist?(Game::SAVE_FILE)
  print 'Found saved game. Would you like to load it? (y/n): '
  game = if gets.chomp.downcase == 'y'
           Game.load_game
         else
           Game.new('google-10000-english-no-swears.txt')
         end
else
  game = Game.new('google-10000-english-no-swears.txt')
end
game.play
