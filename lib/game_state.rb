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
end
