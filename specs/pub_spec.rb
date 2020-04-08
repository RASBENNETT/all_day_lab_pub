require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class PetShopTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("beer", 5)
        @drink2 = Drink.new("cider", 4)
        @drinks = [@drink1, @drink2]
        @pub = Pub.new("The First Post", 200, @drinks)
        @customer1 = Customer.new("Gary King", 10)
        @customer2 = Customer.new("Andy Knight", 1000)
        @customer3 = Customer.new("Steven Prince", 50)
    end

    def test_pub_name()
        assert_equal("The First Post", @pub.name)
    end

    def test_pub_till()
        assert_equal(200, @pub.till)
    end
    
    def test_pub_drinks()
        assert_equal(@drinks, @pub.drinks)
    end
    
    def test_increase_till()
        @pub.increase_till(20)
        assert_equal(220, @pub.till)
    end

    def test_sell_drink()
        @pub.sell_drink(@customer1, @drink1)
        assert_equal(5, @customer1.wallet)
        assert_equal(205, @pub.till)
    end

end
