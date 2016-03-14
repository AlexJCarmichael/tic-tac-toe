
class Player
  attr_accessor :name, :icon, :second_player
  def initialize(name, player_icon = "X", second_player = false)
    @name = name
    @icon = player_icon
    @second_player = second_player
  end
end
