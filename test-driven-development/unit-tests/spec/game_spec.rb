require 'game'

describe 'Game' do
  describe '#match_word' do
    it 'should handle all incorrect letters well' do
      game = Game.new('DRINK')
      guess_word = 'HELLO'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}")
    end

    it 'should handle a wrongly positioned letter well' do
      game = Game.new('DRINK')
      guess_word = 'CLEAN'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E8}")
    end

    it 'should handle a correctly positioned letter well' do
      game = Game.new('DRINK')
      guess_word = 'ALIVE'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E9}\u{1F7E6}\u{1F7E6}")
    end

    it 'should handle an actual english word' do
      game = Game.new('DRINK')
      guess_word = 'ABCDE'

      result = game.match_word(guess_word)

      expect(result).to eq("Not an English word")
    end

    it 'should handle a different length word' do
      game = Game.new('DRINK')
      guess_word = 'ABC'

      result = game.match_word(guess_word)

      expect(result).to eq("The length of the guess word has to same")
    end
  end

  describe '#is_english_word' do
    it 'should return 200 status code (true) when the guess word actually is an english word' do
      game = Game.new('DRINK')
      guess_word = 'WASTE'

      result = game.is_english_word(guess_word)

      expect(result).to eq(true)
    end

    it 'should return 400 status code (false) when the guess word actually is not an english word' do
      game = Game.new('DRINK')
      guess_word = 'ABCDE'

      result = game.is_english_word(guess_word)

      expect(result).to eq(false)
    end
  end

  describe '#is_equal_length' do
    it 'should return true when the guess word and the secret word have a same length' do
      game = Game.new('DRINK')
      guess_word = 'HELLO'

      result = game.is_equal_length(guess_word)
      expect(result).to eq(true)
    end

    it 'should return false when the guess word and the secret word have a different length' do
      game = Game.new('DRINK')
      guess_word = 'HAY'

      result = game.is_equal_length(guess_word)
      expect(result).to eq(false)
    end
  end
end
