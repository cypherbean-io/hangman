# frozen_string_literal: true

class WordBank
  def initialize(file_path)
    @words = File.readlines(file_path).map(&:chomp)
  end

  def random_word
    filtered_words = @words.select { |word| word.length.between?(5, 12) }
    filtered_words.sample
  end
end
