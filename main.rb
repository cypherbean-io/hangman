# frozen_string_literal: true

# Load the contents of the file
words = File.readlines('google-10000-english-no-swears.txt').map(&:chomp)

# Filter words that are 3 letters long or greater
filtered_words = words.select { |word| word.length.between?(5, 12) }

# Select a random word from the filtered list
random_word = filtered_words.sample

# Output the random word
puts random_word
