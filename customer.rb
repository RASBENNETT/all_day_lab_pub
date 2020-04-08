

class Customer

    attr_reader :name, :wallet

    def initialize(name, wallet)
        @name = name
        @wallet = wallet
    end

    def remove_from_wallet(price)
        @wallet -= price if(@wallet >= price)
    end

end
