# frozen_string_literal: true

require_relative '../lib/game_board'

# Connect Four Game Implementation Class
class ConnectFour
  def initialize
    @board = GameBoard.new
    @red_token = '🔴'
    @black_token = '⬤'
  end

  def play
    # This in theory should just be a loop of various functions
  end
end
