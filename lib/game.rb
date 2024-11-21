# frozen_string_literal: true

require 'json'

class Game
  SAVE_FILE = 'saved_game.json'

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
    input = gets.chomp.downcase

    if input == 'save'
      save_game
      return true
    end

    return if @game_state.process_guess(input)

    Display.show_input_error
    sleep(3)
  end

  # Saves the current game state to a file
  def save_game
    game_data = {
      game_state: {
        word: @game_state.word,
        guessed_letters: @game_state.guessed_letters,
        remaining_attempts: @game_state.remaining_attempts
      }
    }

    File.write(SAVE_FILE, JSON.generate(game_data))
    puts "\nGame saved successfully!"
    sleep(2)
  end
end
