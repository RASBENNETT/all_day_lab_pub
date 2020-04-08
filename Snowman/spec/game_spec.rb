require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')
require_relative('../debug_drawing.rb')


class GameTest < Minitest::Test

    def setup()
        @player = Player.new("John")
        @hidden_word = HiddenWord.new("banana")
        @drawing = DebugDrawing.new(@player.lives)
        @game = Game.new(@player, @hidden_word, @drawing)
    end

    def test_guess_letter__present()
        @game.guess_letter("a")
        assert_equal(1, @game.guessed_letters.size)
        assert_equal(6, @player.lives)
        assert_equal("*a*a*a", @hidden_word.secret)
    end

    def test_guess_letter_adds_to_array()
        @game.guess_letter("a")
        @game.guess_letter("w")
        assert_equal(2, @game.guessed_letters.size)
    end

    def test_player_loses_life()
        @game.guess_letter('q')
        assert_equal(5, @player.lives)
    end

    def test_player_keeps_life()
        @game.guess_letter('a')
        assert_equal(6, @player.lives)
    end

    def test_player_keeps_life()
        @game.guess_letter('a')
        assert_equal(6, @player.lives)
    end

    def test_already_chosen_letter()
        @game.guess_letter('a')
        assert_equal("Already Chosen Letter a", @game.guess_letter('a'))
    end

    def test_too_many_letters()
        assert_equal("Please Enter One Letter At A Time", @game.guess_letter('ab'))
    end

    def test_game_won()
        @game.guess_letter('a')
        @game.guess_letter('b')
        @game.guess_letter('n')
        assert(@game.game_is_won?())
    end

    def test_game_lost()
        @game.guess_letter('p')
        @game.guess_letter('a')
        @game.guess_letter('g')
        @game.guess_letter('s')
        @game.guess_letter('t')
        @game.guess_letter('l')
        @game.guess_letter('k')
        assert(@game.game_is_lost?())
    end

    def test_game_drawing()
       @game.draw()
       @game.guess_letter('a')
       @game.draw()
       @game.guess_letter('g')
       @game.draw()
    end


end