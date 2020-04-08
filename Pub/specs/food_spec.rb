require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food.rb')


class FoodTest < MiniTest::Test
    def setup()
        @food = Food.new("Haggis", 8, -5)
    end

    def test_food_name()
        assert_equal("Haggis", @food.name())
    end

    def test_food_pirce()
        assert_equal(8, @food.price)
    end

    def test_food_rejuvination_level()
        assert_equal(-5, @food.rejuvination_level)
    end
end