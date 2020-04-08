class Pub

    attr_reader :name, :till, :drinks

    def initialize(name, till, drinks)
        @name = name
        @till = till
        @drinks = drinks
    end

    def increase_till(price)
        @till += price
    end


    def sell_drink(customer, drink)
        return "Not of age" if !(check_id(customer))
        return "Too drunk" if (customer.drunkenness > 10)
        return "Not enough money" if (customer.wallet < drink.price)
        customer.remove_from_wallet(drink.price)
        increase_till(drink.price)
        customer.modify_drunkenness(drink.alcohol_level)
        drink.stock -= 1
    end

    def sell_food(customer, food)
        return "Not enough money" if (customer.wallet < food.price)
        customer.remove_from_wallet(food.price)
        increase_till(food.price)
        customer.modify_drunkenness(food.rejuvination_level)
    end

    def check_id(customer)
        return true if customer.age >= 18
        return false
    end

    def total_stock()
        total_stock = 0
        for drink in @drinks
            total_stock += drink.stock
        end
        return total_stock
    end

    def stock_value_by_drink(drink)
        return drink.stock * drink.price
    end

    def stock_value()
        total_stock_value = 0 
        for drink in @drinks
            total_stock_value += stock_value_by_drink(drink)
        end
        return total_stock_value
    end

    

end
