# frozen_string_literal: true

# Connect Four Gameboard Class
class GameBoard
  attr_reader :height, :width

  def initialize
    @height = 6
    @width = 7
  end
end
