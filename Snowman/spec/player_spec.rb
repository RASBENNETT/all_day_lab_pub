require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../player.rb')


class PlayerTest < MiniTest::Test

    def setup()
        @player = Player.new("John")
    end 

    def test_class()
        assert_equal(Player, @player.class)
    end

    def test_get_name()
        assert_equal("John", @player.name)
    end 

    def test_get_lives_starts_at_6()
        assert_equal(6, @player.lives)
    end

    def test_remove_life()
        @player.remove_life
        assert_equal(5, @player.lives)
    end 

end