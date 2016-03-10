require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board_state.rb'

class BoardStateTest
  def setup
    @board = BoardState.new
    puts @board.middle_row.class
  end

  def test_for_row_is_an_array
    assert_equal @board.middle_row, Array
  end




end
