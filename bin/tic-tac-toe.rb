require_relative '../lib/board_state.rb'
require_relative '../lib/display_board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/computer.rb'

def time_to_duel
  puts "Let's play tic-tac-toe."
  puts "1. Single player versus a computer player."
  puts "2. A player vs player, PvP as it were, expierience."
  puts "3. Or you could exit the game."
  puts "Please select 1, 2, or 3."
end

def check_selection(selector, board, player, player_two, is_computer)
  if selector.class == Fixnum
    if is_computer
      selector = player_two.icon
      return true
    elsif player_two.second_player
      selector = player_two.icon
      return true
    else
      selector = player.icon
      return true
  end
  else
    puts "Invalid selection, please select again."
  end
end

def player_first(player)
  print "What name do you wish to play as? "
  user = gets.chomp
  player.name = user
  print "What icon would #{player.name} like to use? X is the default. "
  player.icon = gets.chomp.upcase
  if player.icon == ""
    player.icon = "X"
  end
  puts "#{player.name} has entered the fray!"
end

def player_second(player)
  print "What name do you wish to play as? "
  user = gets.chomp
  player.name = user
  print "What icon would #{player.name} like to use? O is the default. "
  player.icon = gets.chomp.upcase
  if player.icon == ""
    player.icon = "O"
  end
  puts "#{player.name} has entered the fray!"
end


def computer_oponent(player_two, player)
  player_two.name = "Reginald"
  if player.icon == "O"
    player_two.icon = "X"
  else
    player_two.icon = "O"
  end
  puts "Your oponent today is the vile #{player_two.name}!"
  puts "Your oponent's icon will be #{player_two.icon}"
end

def computer_logic(player_two, board, display_board, player)
  puts "#{player_two.name}'s turn!"
  make_selection(board, display_board, player, player_two, true)
  display_board.print_board
  puts "#{player_two.name} has moved."
end

def make_selection(board, display_board, player, player_two, is_computer = false)
  valid_selection = false
  until valid_selection
    if is_computer
      selection = rand(1..9)
    elsif player_two.second_player
      print "#{player_two.name} where do you wish to place your mark? >"
      selection = gets.chomp.to_i
    else
      print "#{player.name} where do you wish to place your mark? > "
      selection = gets.chomp.to_i
    end
    if selection == 1
      selector = board.ul
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.ul = player_two.icon
        elsif player_two.second_player
          board.ul = player_two.icon
        else
          board.ul = player.icon
        end
        valid_selection = true
      end
    elsif selection == 2
      selector = board.um
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.um = player_two.icon
        elsif player_two.second_player
          board.um = player_two.icon
        else
          board.um = player.icon
        end
      valid_selection = true
      end
    elsif selection == 3
      selector = board.ur
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.ur = player_two.icon
        elsif player_two.second_player
          board.ur = player_two.icon
        else
          board.ur = player.icon
        end
      valid_selection = true
      end
    elsif selection == 4
      selector = board.ml
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.ml = player_two.icon
        elsif player_two.second_player
          board.ml = player_two.icon
        else
          board.ml = player.icon
        end
      valid_selection = true
      end
    elsif selection == 5
      selector = board.mm
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.mm = player_two.icon
        elsif player_two.second_player
          board.mm = player_two.icon
        else
          board.mm = player.icon
        end
      valid_selection = true
      end
    elsif selection == 6
      selector = board.mr
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.mr = player_two.icon
        elsif player_two.second_player
          board.mr = player_two.icon
        else
          board.mr = player.icon
        end
      valid_selection = true
      end
    elsif selection == 7
      selector = board.ll
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.ll = player_two.icon
        elsif player_two.second_player
          board.ll = player_two.icon
        else
          board.ll = player.icon
        end
      valid_selection = true
      end
    elsif selection == 8
      selector = board.lm
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.lm = player_two.icon
        elsif player_two.second_player
          board.lm = player_two.icon
        else
          board.lm = player.icon
        end
      valid_selection = true
      end
    elsif selection == 9
      selector = board.lr
      if check_selection(selector, board, player, player_two, is_computer)
        if is_computer
          board.lr = player_two.icon
        elsif player_two.second_player
          board.lr = player_two.icon
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

def game_logic(board, display_board, player, player_two, game_type)
  puts "Please select a space on the board."
  winner = false
  until winner
    player_two.second_player = false
    display_board.print_board
    make_selection(board, display_board, player, player_two)
    winner = winning_checks(board)
    if winner
      puts "#{player.name} has a tic-tac-toe!"
      display_board.print_board
      break
    end
    if board.is_draw?
      puts "It's a tie?"
      break
    end
    display_board.print_board
    if game_type == "1"
      computer_logic(player_two, board, display_board, player)
    elsif game_type == "2"
      player_two.second_player = true
      make_selection(board, display_board, player, player_two)
    end
    winner = winning_checks(board)
    if winner
       puts "#{player_two.name} has a tic-tac-toe!"
       display_board.print_board
       break
     end
     if board.is_draw?
       puts "It's a tie?"
       break
     end
  end
end

def play_again
  puts "Do you want to play again? (yes) or (no)"
  again = gets.chomp.upcase
  if again == "YES"
  elsif again == "NO"
    puts "So long, farewell, auf wiedersehen, good-bye."
    exit
  else
    puts "Please select yes or no."
  end
end

def start
  loop do
    time_to_duel
    game_type = gets.chomp
    case
    when game_type == "1"
      player = Player.new("user")
      player_first(player)
      player_two = Computer.new("Reginald")
      computer_oponent(player_two, player)
    when game_type == "2"
      player = Player.new("user")
      player_first(player)
      player_two = Player.new("user2")
      puts "*********This is data for player two******"
      player_second(player_two)
    end
    board = BoardState.new(player.icon, player_two.icon)
    display_board = DisplayBoard.new(board)
    game_logic(board, display_board, player, player_two, game_type)
    play_again
  end
end

class TicTacToe
  start
end
