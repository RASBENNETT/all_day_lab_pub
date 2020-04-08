class Player

    attr_accessor :name
    attr_reader :lives


    def initialize(name)
        @name = name
        @lives = 6
    end

    def remove_life()
        @lives -=1
    end



end