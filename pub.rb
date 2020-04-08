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
        if(check_id(customer))
            customer.remove_from_wallet(drink.price)
            increase_till(drink.price)
        else
            return "Not of age"
        end
    end

    def check_id(customer)
        return true if customer.age >= 18
        return false
    end

end
