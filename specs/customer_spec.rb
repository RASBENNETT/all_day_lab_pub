require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')


class CustomerTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new("Gary King", 10)
        @customer2 = Customer.new("Andy Knight", 1000)
        @customer3 = Customer.new("Steven Prince", 50)
    end

    def test_class()
        assert_equal(Customer, @customer1.class)
    end

    def test_get_customer_name()
        assert_equal("Gary King", @customer1.name)
    end

    def test_remove_from_wallet()
        assert_equal(5, @customer1.remove_from_wallet(5))
    end

end
