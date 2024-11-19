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
    Display.show_result(@game_state)
  end

  private

  # Prompts the player for a letter and processes the guess
  def process_turn
    print "\nEnter a letter:"
    letter = gets.chomp.downcase

    return if @game_state.process_guess(letter)

    Display.show_input_error
    sleep(3)
  end
end
