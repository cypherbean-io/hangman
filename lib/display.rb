# frozen_string_literal: true

class Display
  def self.show_game_state(game_state)
    puts "\nWord: #{game_state.masked_word}"
    puts "Remaining attempts: #{game_state.remaining_attempts}"
    puts "Guessed letters: #{game_state.guessed_letters.join(', ')}"
  end
end
