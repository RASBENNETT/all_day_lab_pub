require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("beer", 5, 2, 100)
        @drink2 = Drink.new("cider", 4, 3, 100)
        @drinks = [@drink1, @drink2]
        @pub = Pub.new("The First Post", 200, @drinks)
        @customer1 = Customer.new("Gary King", 10, 34)
        @customer2 = Customer.new("Andy Knight", 1000, 17)
        @customer3 = Customer.new("Steven Prince", 100, 34)
        @customer4 = Customer.new("Steven Prince", 100, 18)
        @food1 = Food.new("Nachos", 10, -5)
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

    def test_check_id()
        assert(@pub.check_id(@customer1))
        refute(@pub.check_id(@customer2))
        assert(@pub.check_id(@customer4))
    end


    def test_sell_drink__over_18()
        @pub.sell_drink(@customer1, @drink1)
        assert_equal(5, @customer1.wallet)
        assert_equal(205, @pub.till)
        assert_equal(199, @pub.total_stock)
    end
     
    def test_sell_drink_under_18()
        assert_equal("Not of age", @pub.sell_drink(@customer2, @drink1))
        assert_equal(1000, @customer2.wallet)
        assert_equal(200, @pub.till)
    end

  

    def test_sell_drink_drunkenness_level()
        @pub.sell_drink(@customer3, @drink1)
        assert_equal(95, @customer3.wallet)
        @pub.sell_drink(@customer3, @drink1)
        @pub.sell_drink(@customer3, @drink2)
        @pub.sell_drink(@customer3, @drink2)
        @pub.sell_drink(@customer3, @drink1)
        assert_equal(77, @customer3.wallet)
        assert_equal(195, @pub.total_stock)
        assert_equal(97, @drink1.stock)
    end

    def test_sell_drink_not_enough_money()
        @pub.sell_drink(@customer1, @drink1)
        @pub.sell_drink(@customer1, @drink1)
        @pub.sell_drink(@customer1, @drink1)
        assert_equal("Not enough money",@pub.sell_drink(@customer1, @drink1))
        
    end

    def test_sell_food()
        @pub.sell_food(@customer3, @food1)
        assert_equal(90, @customer3.wallet)
        assert_equal(210, @pub.till)
        assert_equal(-5, @customer3.drunkenness)
    end

    def test_sell_food_not_enough_money()
        @pub.sell_food(@customer1, @food1)
        assert_equal("Not enough money",@pub.sell_food(@customer1, @food1))
    end

    def test_get_total_stock()
        assert_equal(200, @pub.total_stock)
    end

    def test_stock_value_by_drink()
        assert_equal(400, @pub.stock_value_by_drink(@drink2))
    end

    def test_stock_value()
        assert_equal(900, @pub.stock_value)
    end
    
end
