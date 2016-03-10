require_relative '../lib/board_state.rb'
require_relative '../lib/display_board.rb'

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

class TicTacToe
  time_to_duel
  board = BoardState.new
  display_board = DisplayBoard.new(board)
  display_board.print_board
end
