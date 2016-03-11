
class DisplayBoard
  def initialize (board)
    @board = board
  end
  def print_board
    puts " #{@board.ul.to_s} | #{@board.um.to_s} | #{@board.ur.to_s} "
    puts "-" * 12
    puts " #{@board.ml.to_s} | #{@board.mm.to_s} | #{@board.mr.to_s} "
    puts "-" * 12
    puts " #{@board.ll.to_s} | #{@board.lm.to_s} | #{@board.lr.to_s} "
  end
end
