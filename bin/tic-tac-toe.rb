require_relative '../lib/board_state.rb'
require_relative '../lib/display_board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/computer.rb'

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

def check_selection(selector, board, player, computer, is_computer)
  if selector.class == Fixnum
    if is_computer
      selector = computer.icon
      return true
    else
      selector = player.icon
      return true
  end
  else
    puts "Invalid selection, please select again."
  end
end

def computer_logic(computer, board, display_board, player)
  puts "#{computer.name}'s turn!"
  make_selection(board, display_board, player, computer, true)
  display_board.print_board
  puts "#{computer.name} has moved."
end

def make_selection(board, display_board, player, computer, is_computer = false)
  valid_selection = false
  until valid_selection
    if is_computer
      selection = rand(1..9)
    else
      print "#{player.name} where do you wish to place your mark? > "
      selection = gets.chomp.to_i
    end
    if selection == 1
      selector = board.ul
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.ul = computer.icon
        else
          board.ul = player.icon
        end
        valid_selection = true
      end
    elsif selection == 2
      selector = board.um
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.um = computer.icon
        else
          board.um = player.icon
        end
      valid_selection = true
      end
    elsif selection == 3
      selector = board.ur
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.ur = computer.icon
        else
          board.ur = player.icon
        end
      valid_selection = true
      end
    elsif selection == 4
      selector = board.ml
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.ml = computer.icon
        else
          board.ml = player.icon
        end
      valid_selection = true
      end
    elsif selection == 5
      selector = board.mm
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.mm = computer.icon
        else
          board.mm = player.icon
        end
      valid_selection = true
      end
    elsif selection == 6
      selector = board.mr
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.mr = computer.icon
        else
          board.mr = player.icon
        end
      valid_selection = true
      end
    elsif selection == 7
      selector = board.ll
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.ll = computer.icon
        else
          board.ll = player.icon
        end
      valid_selection = true
      end
    elsif selection == 8
      selector = board.lm
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.lm = computer.icon
        else
          board.lm = player.icon
        end
      valid_selection = true
      end
    elsif selection == 9
      selector = board.lr
      if check_selection(selector, board, player, computer, is_computer)
        if is_computer
          board.lr = computer.icon
        else
          board.lr = player.icon
        end
      valid_selection = true
      end
    else
      display_board.print_board
      print "Please make a valid selection of 1-9 "
    end
  end
  valid_selection = false
end

def winning_checks(board)
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
    return true
  end
end

def is_draw?(board)
   if board.is_draw?
     puts "It's a tie?"
     return true
   end
end

def game_logic(board, display_board, player, computer)
  puts "Please select a space on the board."
  winner = false
  until winner
    display_board.print_board
    make_selection(board, display_board, player, computer)
    winner = winning_checks(board)
    if winner
      puts "#{player.name} has a tic-tac-toe!"
      break
    end
    #winner = is_draw?(board)
    computer_logic(computer, board, display_board, player)
    winner = winning_checks(board)
    if winner
       puts "#{computer.name} has a tic-tac-toe!"
       break
     end
     #winner = is_draw?(board)
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
  computer = Computer.new(computer)
  print "What icon would #{player.name} like to use? X is the default. "
  player.icon = gets.chomp
  puts "#{player.name} has entered the fray!"
  computer.name = "Reginald"
  computer.icon = "O"
  puts "Your oponent today is the vile #{computer.name}!"
  board = BoardState.new(player.icon, computer.icon)
  display_board = DisplayBoard.new(board)
  game_logic(board, display_board, player, computer)
end
