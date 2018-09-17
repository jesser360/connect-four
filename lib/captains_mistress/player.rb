require_relative 'board'

class Player
  attr_accessor :number,:piece,:board

  def initialize(number,piece,board)
      @number = number
      @piece = piece
      @board = board
  end

  def ask_user(player)
    print 'Player '
    print player.number
    puts 's turn'
    print 'You are: '
    puts player.piece
    puts 'Which column do you wasnt to place token?'

    column = gets.chomp.to_i
    if ~ /^-?[0-6]+$/
      @board.drop_piece(player,column,@board)
    else
      puts 'enter number between 0 -6'
      ask_user(player)
    end
  end

end
