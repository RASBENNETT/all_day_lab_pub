class Game

    attr_reader :player, :hidden_word, :guessed_letters, :drawing

    def initialize(player, hidden_word, drawing)
        @player = player
        @hidden_word = hidden_word
        @guessed_letters = []
        @drawing = drawing
    end


    def guess_letter(letter)
        # CHECK INPUT
        return puts "Already Chosen Letter #{letter}" if @guessed_letters.include?(letter)
        return puts "Please Enter One Letter At A Time" if letter.length > 1

        # ADD TO ARRAY
        @guessed_letters << letter

        # CHECK ANSWER
        if @hidden_word.letter_in_secret?(letter)
        @hidden_word.reveal_letter(letter)
        else
        @player.remove_life 
        end
    end

    def game_is_won?()
        return !@hidden_word.secret.include?('*')
    end

    def game_is_lost?()
        return @player.lives == 0
    end

    def draw(lives)
        puts "Already Guessed :: #{@guessed_letters}
        " +
        
        @drawing.determine_drawing(lives) + "

        " + @hidden_word.secret
    end



end