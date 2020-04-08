require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../hidden_word.rb')

class HiddenWordTest < Minitest::Test

    def setup()
        @hidden_word = HiddenWord.new("banana")
    end

    def test_get_hidden_word()
        assert_equal("******", @hidden_word.secret)
    end

    def test_reveal_letter()
        @hidden_word.reveal_letter('a')
    end

end