
class Board
  attr_accessor :board

  def initialize
      @board = empty_board
  end

  def empty_board
    return [
      ['_','_','_','_','_','_','_'],
      ['_','_','_','_','_','_','_'],
      ['_','_','_','_','_','_','_'],
      ['_','_','_','_','_','_','_'],
      ['_','_','_','_','_','_','_'],
      ['_','_','_','_','_','_','_'],
      ['0','1','2','3','4','5','6']
    ]
  end

  def reset_board
    @board = empty_board
  end

  def render_board
    board.each do |row|
      print row
      puts ""
    end
  end

  def drop_piece(player,column,board)
    @board.reverse.each do |row|
      if row[column] == '_'
        row[column] = player.piece
        return
      end
    end
    puts 'not an available space,please try again'
    board.render_board
    player.ask_user(player)
  end

  def check_for_win(player)
    @board.each_with_index do |row,index|
      row.each_with_index do |space,i|
        if space == player.piece.to_s
          # CHECKING FOR A ROW WIN
          if (row[i-3]==player.piece && row[i-2]==player.piece && row[i-1]==player.piece) || (row[i+3]==player.piece && row[i+2]==player.piece && row[i+1]==player.piece)
            return true
            # CHECKING FOR A HORIZONTAL WIN
          elsif (@board[index-1][i]==player.piece && @board[index-2][i]==player.piece && @board[index-3][i]==player.piece) || (@board[index+1][i]==player.piece && @board[index+2][i]==player.piece && @board[index+3][i]==player.piece)
            return true
            # CHECKING FOR A DIAGONAL WIN
          elsif (@board[index-1][i-1]==player.piece && @board[index-2][i-2]==player.piece && @board[index-3][i-3]==player.piece) || (@board[index+1][i+1]==player.piece && @board[index+2][i+2]==player.piece && @board[index+3][i+3]==player.piece)
            return true
          end
        end
      end
    end
  end

  def check_draw
    @draw = true
    @board.each do |row|
      if !row.include?('_')
        return false
      end
    end
    return true
  end


end
