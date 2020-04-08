require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')

class GameTest < Minitest::Test

    def setup()
        @player = Player.new("John")
        @hidden_word = HiddenWord.new("banana")
        @game = Game.new(@player, @hidden_word)
    end

    def test_guess_letter()
        assert(@game.guess_letter("a"))
    end

    def test_guess_letter_adds_to_array()
        @game.guess_letter("a")
        @game.guess_letter("w")
        assert_equal(2, @game.guessed_letters.size)
    end


end