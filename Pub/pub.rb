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
        customer.remove_from_wallet(drink.price)
        increase_till(drink.price)
        customer.modify_drunkenness(drink.alcohol_level)
        # if(check_id(customer)) && customer.drunkenness < 10
            # customer.remove_from_wallet(drink.price)
            # increase_till(drink.price)
            # customer.increase_drunkenness(drink.alcohol_level)
        # elsif !(check_id(customer))
        #     return "Not of age" 
        # elsif customer.drunkenness < 10
        #     return "Too Drunk"  
        # end
    end

    def sell_food(customer, food)
        customer.remove_from_wallet(food.price)
        increase_till(food.price)
        customer.modify_drunkenness(food.rejuvination_level)
    end

    def check_id(customer)
        return true if customer.age >= 18
        return false
    end

end
