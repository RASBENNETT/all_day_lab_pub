

class Customer

    attr_reader :name, :wallet, :age, :drunkenness

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = 0
    end

    def remove_from_wallet(price)
        @wallet -= price if(@wallet >= price)
    end

    def increase_drunkenness(alcohol_level)
        @drunkenness += alcohol_level
    end
end
