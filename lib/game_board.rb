# frozen_string_literal: true

# Connect Four Gameboard Class
class GameBoard
  attr_reader :height, :width, :board

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

  def exist?
    true
  end

  def to_s
    board_top + board_middle + board_bottom
  end

  def board_top
    <<~TOP
       0 1 2 3 4 5 6
      ┏━┳━┳━┳━┳━┳━┳━┓
    TOP
  end

  def board_middle
    middle = ''
    @board.transpose.each do |row|
      row.each do |column|
        middle += column.nil? ? '┃ ' : "┃#{column}"
      end
      middle += "┃\n"
    end
    middle
  end

  def board_bottom
    <<~BOTTOM
      ┗━┻━┻━┻━┻━┻━┻━┛
    BOTTOM
  end
end
