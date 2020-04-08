

class Customer

    attr_reader :name, :wallet, :age

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
    end

    def remove_from_wallet(price)
        @wallet -= price if(@wallet >= price)
    end

end
