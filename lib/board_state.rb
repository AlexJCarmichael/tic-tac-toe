
class BoardState
  attr_accessor :ul, :um, :ur, :ml, :mm, :mr, :ll, :lm, :lr
  def initialize
    @ul = "1"
    @um = "2"
    @ur = "3"
    @ml = "4"
    @mm = "5"
    @mr = "6"
    @ll = "7"
    @lm = "8"
    @lr = "9"
  end

  def top_row_win
    if @ul == "X" && @um == "X" && @ur == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def middle_row_win
    if @ml == "X" && @mm == "X" && @mr == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def bottom_row_win
    if @ll == "X" && @lm == "X" && @lr == "X"
      puts "Tic-tac-toe!"
    end
  end
  def left_column_win
    if @ul == "X" && @ml == "X" && @ll == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def middle_column_win
    if @um == "X" && @mm == "X" && @lm == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def right_column_win
    if @ur == "X" && @mr == "X" && @lr == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def diagonal_down_right
    if @ul == "X" && @mm == "X" && @lr == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
  def diagonal_up_right
    if @ll == "X" && @mm == "X" && @ur == "X"
      puts "Tic-tac-toe!"
      return true
    end
  end
end
