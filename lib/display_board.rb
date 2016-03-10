
class DisplayBoard
  def initialize (board)
    @board = board
  end
  def print_board
    puts " #{@board.upper_row[0]} | #{@board.upper_row[1]} | #{@board.upper_row[2]} "
    puts "-" * 15
    puts " #{@board.middle_row[0]} | #{@board.middle_row[1]}  | #{@board.middle_row[2]} "
    puts "-" * 15
    puts " #{@board.lower_row[0]} | #{@board.lower_row[1]} | #{@board.lower_row[2]} "
  end
end
