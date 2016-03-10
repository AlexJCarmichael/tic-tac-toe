
class BoardState
  attr_accessor :upper_row, :middle_row, :lower_row
  def initialize
    @upper_row = ["ul", "um", "ur"]
    @middle_row = ["ml", "m", "mr"]
    @lower_row = ["ll", "lm", "lr"]
  end
end
