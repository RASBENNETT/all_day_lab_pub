

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

    def modify_drunkenness(alcohol_modifier)
        @drunkenness += alcohol_modifier
    end

end
