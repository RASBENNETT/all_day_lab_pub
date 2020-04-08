class HiddenWord

    attr_reader :secret 

    def initialize(word)
        @word = word
        @secret = "*" * word.length 
    end

    def letter_in_secret?(letter)
        return @word.include?(letter)
    end

    def reveal_letter(letter)
        if letter_in_secret?(letter)
            for i in 0...@word.length
                if @word[i] == letter
                   @secret[i] = letter
                   i +=1
                end
            end
        end
    end


end