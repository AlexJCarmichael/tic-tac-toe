require_relative '../lib/board_state.rb'
require_relative '../lib/display_board.rb'
require_relative '../lib/player.rb'

def time_to_duel
  puts "Let's play tic-tac-toe."
  puts "Please select (play) or (quit)."
  play = gets.chomp.upcase
  if play == "PLAY"
    puts "Let us begin!"
  elsif play == "QUIT"
    puts "So long, farewell, auf wiedersehen, good-bye."
    exit
  else
    puts "You did not select (play) or (quit). Please select one."
    time_to_duel
  end
end

def make_selection(board, display_board)
  puts "Please select a space on the board."
  winner = false
  until winner
    selection = gets.chomp
    if selection == "1"
      board.ul = "X"
    elsif selection == "2"
      board.um = "X"
    elsif selection == "3"
      board.ur = "X"
    elsif selection == "4"
      board.ml = "X"
    elsif selection == "5"
      board.mm = "X"
    elsif selection == "6"
      board.mr = "X"
    elsif selection == "7"
      board.ll = "X"
    elsif selection == "8"
      board.lm = "X"
    elsif selection == "9"
      board.lr = "X"
    else
      display_board.print_board
      print "Please make a valid selection of 1-9 "
    end
    display_board.print_board
    winning_checks = [
      board.top_row_win?,
      board.middle_row_win?,
      board.bottom_row_win?,
      board.right_column_win?,
      board.middle_column_win?,
      board.left_column_win?,
      board.diagonal_down_right?,
      board.diagonal_up_right?,
      ]
    if winning_checks.any?
      puts "tic-tac-toe!"
      winner = true
    end
  end
end

# def play_again
#   puts "Do you want to play again? (yes) or (no)"
#   again = gets.chomp.upcase
#   if again == "YES"
#   elsif again == "NO"
#     puts "Good-bye"
#     exit
#   else
#     puts "Tim Allen Noise."
#   end
# end

class TicTacToe
  time_to_duel
  board = BoardState.new
  print "What name do you wish to play as? "
  user = gets.chomp
  player = Player.new(user)
  puts "#{player.name} has entered the fray!"
  display_board = DisplayBoard.new(board)
  display_board.print_board
  make_selection(board, display_board)
end
