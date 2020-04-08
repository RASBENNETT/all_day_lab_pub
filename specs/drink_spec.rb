require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink.rb')

class DrinkTest < MiniTest::Test


    def setup()
        @drink1 = Drink.new("Tennents", 3, 2)
    end

    def test_class()
        assert_equal(Drink, @drink1.class)
    end

    def test_get_drink_name()
        assert_equal("Tennents", @drink1.name)
    end

    def test_get_drink_price()
        assert_equal(3, @drink1.price)
    end

    def test_get_alcohol_level()
        assert_equal(2, @drink1.alcohol_level)
    end
end