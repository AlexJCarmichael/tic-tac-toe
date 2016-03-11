require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board_state.rb'

class BoardStateTest < Minitest::Test
  def setup
    @board = BoardState.new
  end

  def test_for_ul_contains_string
    assert_equal String, @board.ul.class
  end
  def test_for_um_contains_string
    assert_equal String, @board.um.class
  end
  def test_for_ur_contains_string
    assert_equal String, @board.ur.class
  end
  def test_for_ml_contains_string
    assert_equal String, @board.ml.class
  end
  def test_for_mm_contains_string
    assert_equal String, @board.mm.class
  end
  def test_for_mr_contains_string
    assert_equal String, @board.mr.class
  end
  def test_for_ll_contains_string
    assert_equal String, @board.ll.class
  end
  def test_for_lm_contains_string
    assert_equal String, @board.lm.class
  end
  def test_for_lr_contains_string
    assert_equal String, @board.lr.class
  end
end
