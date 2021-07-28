# frozen_string_literal: true

# Connect Four Gameboard Class
class GameBoard
  attr_reader :height, :width

  def initialize
    @height = 6
    @width = 7
    @board = Array.new(@width) { Array.new(@height) }
  end

  def move(column, token)
    row = 0
    while @board[column][row + 1].nil?
      # Column is empty
      break if row == @height - 1

      row += 1
    end
    @board[column][row] = token
  end

  def valid_move?(column)
    # Column is not full
    @board[column][0].nil?
  end
end
