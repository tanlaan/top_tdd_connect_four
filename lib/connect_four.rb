# frozen_string_literal: true

require_relative '../lib/game_board'

# Connect Four Game Implementation Class
class ConnectFour
  def initialize
    @board = GameBoard.new
    @red_token = '🔴'
    @black_token = '⚫'
  end

  def play
    # initialize game state
    # for now, do nothing
    # game loop
    # win state message
    move_counter = 1
    until winner?
      move_counter.even? ? computer_move : human_move
      print @board
      move_counter += 1
    end
    print "#{winner} won the game in #{move_counter} moves!"
  end

  def human_move
    computer_move(@red_token)
  end

  def computer_move(token = @black_token)
    position = 0
    loop do
      position = Random.rand(@board.width)
      break if @board.valid_move?(position)
    end
    @board.move(position, token)
  end

  def winner?
    # booleanize the return value of winner
    !!winner
  end

  def winner
    # return winning token
    #
    # begin search at bottom row
    (0...@board.width).each do |x|
      (0...@board.height).reverse_each do |y|
        token = winner_search(x, y)
        return token if token
      end
    end

    nil
  end

  def winner_search(x, y)
    # Looks for matching tokens in surrounding positions
    # Returns token if matching token is row of four
    return false if @board.board[x][y].nil?

    search_area = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0]]
    search_area.each do |delta_x, delta_y|
      return @board.board[x][y] if row_of_n?(4, x, y, delta_x, delta_y)
    end

    nil
  end

  def row_of_n?(row_length, x, y, delta_x, delta_y)
    # This feels kind of grungy.
    # What would be a better way to iterate/check these values
    token = @board.board[x][y]
    (row_length - 1).times do
      x += delta_x
      y += delta_y
      return false if x >= @board.width || y >= @board.height || x.negative? || y.negative?
      return false if token != @board.board[x][y]
    end
    true
  end
end
