require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')


class CustomerTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new("Gary King", 10, 34)
        @customer2 = Customer.new("Andy Knight", 1000, 35)
        @customer3 = Customer.new("Steven Prince", 50, 37)
    end

    def test_class()
        assert_equal(Customer, @customer1.class)
    end

    def test_get_customer_name()
        assert_equal("Gary King", @customer1.name)
    end

    def test_get_customer_age()
        assert_equal(34, @customer1.age)
    end

    def test_remove_from_wallet()
        assert_equal(5, @customer1.remove_from_wallet(5))
    end

    def test_get_drunkenness_starts_at_zero()
        assert_equal(0, @customer1.drunkenness)
    end

    def test_increase_drunkenness()
        @customer1.modify_drunkenness(2)
        assert_equal(2, @customer1.drunkenness)
    end

    def test_decrease_drunkenness()
        @customer1.modify_drunkenness(-2)
        assert_equal(-2, @customer1.drunkenness)
    end

end
