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

def check_selection(selector, board, player)
  if selector.class == Fixnum
    selector = player.icon
    return true
  else
    puts "Invalid selection, please select again."
  end
end

def make_selection(board, display_board, player)
  puts "Please select a space on the board."
  winner = false
  until winner
    selection = gets.chomp
    if selection == "1"
      selector = board.ul
      if check_selection(selector, board, player)
        board.ul = player.icon
      end
    elsif selection == "2"
      selector = board.um
      if check_selection(selector, board, player)
        board.um = player.icon
      end
    elsif selection == "3"
      selector = board.ur
      if check_selection(selector, board, player)
        board.ur = player.icon
      end
    elsif selection == "4"
      selector = board.ml
      if check_selection(selector, board, player)
        board.ml = player.icon
      end
    elsif selection == "5"
      selector = board.mm
      if check_selection(selector, board, player)
        board.mm = player.icon
      end
    elsif selection == "6"
      selector = board.mr
      if check_selection(selector, board, player)
        board.mr = player.icon
      end
    elsif selection == "7"
      selector = board.ll
      if check_selection(selector, board, player)
        board.ll = player.icon
      end
    elsif selection == "8"
      selector = board.lm
      if check_selection(selector, board, player)
        board.lm = player.icon
      end
    elsif selection == "9"
      selector = board.lr
      if check_selection(selector, board, player)
        board.lr = player.icon
      end
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
  print "What name do you wish to play as? "
  user = gets.chomp
  player = Player.new(user)
  print "What icon would #{player.name} like to use? X is the default. "
  player.icon = gets.chomp
  puts "#{player.name} has entered the fray!"
  computer = "Reginald"
  computer_icon = "O"
  puts "Your oponent today is the vile #{computer}!"
  board = BoardState.new(player.icon, computer_icon)
  display_board = DisplayBoard.new(board)
  display_board.print_board
  make_selection(board, display_board, player)
end
