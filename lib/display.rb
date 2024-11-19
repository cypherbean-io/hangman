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

  def self.show_result(game_state)
    show_game_state(game_state)
    if game_state.won?
      puts "\nCongratulations! You won! The word was '#{game_state.word}.'"
    else
      puts "\nGame over! The word was '#{game_state.word}'"
    end
  end

  def self.show_input_error
    puts "\nInvalid input! Please enter a single letter (a-z) that hasn't been guessed."
  end
end
