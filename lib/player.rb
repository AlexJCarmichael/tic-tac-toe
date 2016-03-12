
class Player
  attr_accessor :name, :icon
  def initialize(name, player_icon = "X")
    @name = name
    @icon = player_icon
  end
end
