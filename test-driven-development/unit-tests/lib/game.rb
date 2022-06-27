require 'net/http'
require 'json'

class Game
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    guess_word = guess_word.upcase
    unless is_equal_length(guess_word)
      return "The length of the guess word has to same"
    end

    unless is_english_word(guess_word)
      return "Not an English word"
    end

    guess_word.split('').each_with_index do |letter, index|
      if @secret_word[index] == letter
        result[index] = "\u{1F7E9}"
      elsif @secret_word.include?(letter)
        result[index] = "\u{1F7E8}"
      end
    end

    result
  end

  def is_english_word(guess_word)
    uri = URI("https://api.dictionaryapi.dev/api/v2/entries/en/#{guess_word}")
    response = Net::HTTP.get_response(uri)
    response.code === "200"
  end

  def is_equal_length(guess_word)
    @secret_word.length === guess_word.length
  end
end
