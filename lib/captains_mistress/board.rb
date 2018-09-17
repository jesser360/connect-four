
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

  def check_rows(player)
    @board.each do |row|
      row.each_with_index do |space,index|
        if space == player.piece.to_s
          # CHANGE TO ONLY CHECK NEARBY ROWS BASED ON SPACE INDEX(check if they exist only)
          if (row[index-3]==player.piece && row[index-2]==player.piece && row[index-1]==player.piece) || (row[index+3]==player.piece && row[index+2]==player.piece && row[index+1]==player.piece)
            return true
          end
        end
      end
    end
  end

  def check_columns(player)
    @board.each_with_index do |row,index|
      row.each_with_index do |space,i|
        if space == player.piece.to_s
          if (@board[index-1][i]==player.piece && @board[index-2][i]==player.piece && @board[index-3][i]==player.piece) || (@board[index+1][i]==player.piece && @board[index+2][i]==player.piece && @board[index+3][i]==player.piece)
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

  def check_diagonal(player)
    @board.each_with_index do |row,index|
      row.each_with_index do |space,i|
        if space == player.piece.to_s
          if (@board[index-1][i-1]==player.piece && @board[index-2][i-2]==player.piece && @board[index-3][i-3]==player.piece) || (@board[index+1][i+1]==player.piece && @board[index+2][i+2]==player.piece && @board[index+3][i+3]==player.piece)
            return true
          end
        end
      end
    end
  end



end
