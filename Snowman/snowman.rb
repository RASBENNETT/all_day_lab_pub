require 'io/console'
# password = STDIN.noecho(&:gets).chomp
require_relative('game.rb')
require_relative('player.rb')
require_relative('hidden_word.rb')
require_relative('debug_drawing.rb')

class Snowman

    puts "WELCOME TO SNOWMAN"

    # def initialize(game, player)
    #     @game = game
    #     @player = player
    # end

    def start_new_game()
        puts "Please input player name"
        name = gets.chomp
        @player = Player.new(name)
        puts "Hello #{@player.name}, please enter secret word: "
        @hidden_word_in = STDIN.noecho(&:gets).chomp
        @hidden_word = HiddenWord.new(@hidden_word_in)
        @game = Game.new(@player, @hidden_word, DebugDrawing.new(@player.lives))
        @game.draw(@player.lives)
        play_game()
    end
        
    def play_game()
        while !(@game.game_is_won? || @game.game_is_lost?) do
        print "
        Guess Letter: "
        guess = gets.chomp.downcase
        @game.guess_letter(guess)
        system "clear"
        @game.draw(@player.lives)
        end
        puts "
        Answer was : #{@hidden_word_in.downcase}

        -----GAME OVER-----
        " if @game.game_is_lost?
        puts "
        -----YOU WON-----
        " if @game.game_is_won?
    end

end