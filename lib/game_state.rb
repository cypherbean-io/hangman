# frozen_string_literal: true

class GameState
  attr_reader :word, :guessed_letters, :remaining_attempts

  def initialize(word_bank)
    @word = word_bank.random_word
    @guessed_letters = []
    @remaining_attempts = 6
  end

  # Returns the word with unguessed letters masked
  def masked_word
    word.chars.map { |char| guessed_letters.include?(char) ? char : '_' }.join(' ')
  end

  # Returns true if all characters in the word have been guessed
  def won?
    word.chars.all? { |char| guessed_letters.include?(char) }
  end

  # Returns true if the player has no remaining attempts
  def lost?
    remaining_attempts.zero?
  end

  # Returns true if the game is won or lost
  def game_over?
    won? || lost?
  end

  # Check for valid guess, add to guessed letters, and decrement remaining attempts
  def process_guess(letter)
    return false if invalid_guess?(letter)

    @guessed_letters.push(letter)
    @remaining_attempts -= 1 unless word.include?(letter)
    true
  end

  # Validate the guess is a single letter and hasn't been guessed before
  def invalid_guess?(letter)
    letter.nil? || letter.empty? || !letter.match?(/[a-z]/) || guessed_letters.include?(letter)
  end
end
