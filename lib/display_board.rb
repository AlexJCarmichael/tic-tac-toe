
class DisplayBoard
  def initialize (board)
    @board = board
  end
  def print_board
    puts " #{@board.ul} | #{@board.um} | #{@board.ur} "
    puts "-" * 12
    puts " #{@board.ml} | #{@board.mm} | #{@board.mr} "
    puts "-" * 12
    puts " #{@board.ll} | #{@board.lm} | #{@board.lr} "
  end
end
