# frozen_string_literal: true

require_relative 'lib/game_state'
require_relative 'lib/word_bank'
require_relative 'lib/display'
require_relative 'lib/game'

game = Game.new('google-10000-english-no-swears.txt')
game.play
