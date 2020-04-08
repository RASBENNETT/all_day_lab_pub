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
        customer.remove_from_wallet(drink.price)
        increase_till(drink.price)
    end

end
