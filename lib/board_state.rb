
class BoardState
  attr_accessor :ul, :um, :ur, :ml, :mm, :mr, :ll, :lm, :lr
  def initialize(player_icon, computer_icon)
    @ul = 1
    @um = 2
    @ur = 3
    @ml = 4
    @mm = 5
    @mr = 6
    @ll = 7
    @lm = 8
    @lr = 9
    @player_icon = player_icon
    @computer_icon = computer_icon
  end
  def top_row
    [@ul, @um, @ur]
  end

  def middle_row
    [@ml, @mm, @mr]
  end

  def bottom_row
    [@ll, @lm, @lr]
  end

  def left_column
    [@ul, @ml, @lr]
  end

  def middle_column
    [@um, @mm, @lm]
  end

  def right_column
    [@ur, @mr, @lr]
  end

  def diagonal_down_right
    [@ul, @mm, @lr]
  end

  def diagonal_up_right
    [@ll, @mm, @ur]
  end

  def whole_board
    [@ul, @um, @ur, @ml, @mm, @mr, @ll, @lm, @lr]
  end

  def top_row_win?
    top_row.all? {|element| element == @player_icon } ||
    top_row.all? {|element| element == @computer_icon }
  end

  def middle_row_win?
    middle_row.all? {|element| element == @player_icon } ||
    middle_row.all? {|element| element == @computer_icon }
  end

  def bottom_row_win?
    bottom_row.all? {|element| element == @player_icon } ||
    bottom_row.all? {|element| element == @computer_icon }
  end

  def left_column_win?
    left_column.all? {|element| element == @player_icon} ||
    left_column.all? {|element| element == @computer_icon }
  end

  def middle_column_win?
    middle_column.all? {|element| element == @player_icon } ||
    middle_column.all? {|element| element == @computer_icon }
  end

  def right_column_win?
    right_column.all? {|element| element == @player_icon } ||
    right_column.all? {|element| element == @computer_icon }
  end

  def diagonal_down_right?
    diagonal_down_right.all? {|element| element == @player_icon } ||
    diagonal_down_right.all? {|element| element == @computer_icon }
  end

  def diagonal_up_right?
    diagonal_up_right.all? {|element| element == @player_icon} ||
    diagonal_up_right.all? {|element| element == @computer_icon }
  end

  def is_draw?
    whole_board.all? {|element| element != Fixnum}
  end
end
