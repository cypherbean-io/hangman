# frozen_string_literal: true

class Display
  # ASCII art for different stages of the hangman
  HANGMAN_STATES = [
    "
      +---+
      |   |
          |
          |
          |
          |
    ==========",
    "
      +---+
      |   |
      O   |
          |
          |
          |
    ==========",
    "
      +---+
      |   |
      O   |
      |   |
          |
          |
    ==========",
    "
      +---+
      |   |
      O   |
     /|   |
          |
          |
    ==========",
    "
      +---+
      |   |
      O   |
     /|\\  |
          |
          |
    ==========",
    "
      +---+
      |   |
      O   |
     /|\\  |
     /    |
          |
    ==========",
    "
      +---+
      |   |
      O   |
     /|\\  |
     / \\  |
          |
    =========="
  ].freeze

  def self.show_game_state(game_state)
    system('clear') || system('cls')
    puts HANGMAN_STATES[6 - game_state.remaining_attempts]
    puts "\nWord: #{game_state.masked_word}"
    puts "Remaining attempts: #{game_state.remaining_attempts}"
    puts "Guessed letters: #{game_state.guessed_letters.join(', ')}"
  end
end
