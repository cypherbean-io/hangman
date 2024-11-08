# frozen_string_literal: true

class Game
  def initialize(file_path)
    @game_state = GameState.new(WordBank.new(file_path))
  end

  # Main game loop
  def play
    until @game_state.game_over?
      Display.show_game_state(@game_state)
      process_turn
    end
  end

  private

  # Prompts the player for a letter and processes the guess
  def process_turn
    print "\nEnter a letter:"
    letter = gets.chomp.downcase
    @game_state.process_guess(letter)
  end
end
