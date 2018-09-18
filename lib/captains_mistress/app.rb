require 'captains_mistress'
require_relative 'board'
require_relative 'player'


module CaptainsMistress
  # The application object. Create it with options for the game, then run by
  # calling #run.
  class App
    attr_reader :verbose

    def initialize(options = {})

      @board = Board.new
      @player1 = Player.new(1,'X',@board)
      @player2 = Player.new(2,'O',@board)
      @verbose = options.fetch(:verbose, false)
      @game_over = false
      @draw = false
    end

    def run
      @counter = 0
      while (@game_over == false && @draw == false)
        @board.render_board
        if (@counter % 2 == 0)
          @counter += 1
          @player1.ask_user(@player1)
          check_game_over(@player1)
        else
          @counter += 1
          @player2.ask_user(@player2)
          check_game_over(@player2)
        end
      end
    end

    def check_game_over(player)
      show_winner(player) if @board.check_for_win(player) == true
      draw if @board.check_draw == true
    end

    def show_winner(player)
      @board.render_board
      print 'Game Over -- Player '
      print player.number
      puts ' won'
      @game_over = true
      ask_to_play_again
    end

    def draw
      @draw = true
      ask_to_play_again
    end

    def ask_to_play_again
        puts 'Would you like to play again (yes or no)?'
        answer = gets.chomp.downcase
        if answer == 'yes'
          @game_over = false
          @board.reset_board
        elsif answer == 'no'
          puts 'OK thanks for playing'
        else
          puts 'please answer yes or no'
        end
      end
  end

end
