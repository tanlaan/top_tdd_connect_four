# frozen_string_literal: true

require_relative '../lib/game_board'

RSpec.describe GameBoard do
  context 'creates a board on initialization' do
    subject(:start_board) { described_class.new }

    let(:inner_board) { start_board.instance_variable_get(:@board) }

    it 'has a width of 7' do
      expect(start_board.width).to eq(7)
    end

    it 'has a height of 6' do
      expect(start_board.height).to eq(6)
    end

    it 'has a board that matches width in width' do
      expect(inner_board.length).to eq(start_board.width)
    end

    it 'has a board that matches height in height' do
      expect(inner_board[0].length).to eq(start_board.height)
    end
  end

  context 'board can take moves' do
    subject(:move_board) { described_class.new }
    let(:inner_board) { move_board.instance_variable_get(:@board) }

    context 'when column is empty' do
      it 'puts a token to the bottom of the row' do
        token = '*'
        move_board.move(0, token)
        expect(inner_board[0][5]).to eq(token)
      end

      it 'leaves the second from the bottom empty' do
        token = '*'
        move_board.move(0, token)
        expect(inner_board[0][4]).to be_nil
      end
    end

    context 'when column already has a token' do
      it 'stacks tokens' do
        token = '*'
        2.times { move_board.move(0, token) }
        expect(inner_board[0][4]).to eq(token)
      end
    end
  end

  context 'board can verify valid moves' do
    subject(:valid_move_board) { described_class.new }

    context 'when the column is empty' do
      it 'returns true' do
        result = valid_move_board.valid_move?(0)
        expect(result).to be true
      end
    end

    context 'when the column is half full' do
      it 'returns true' do
        3.times { valid_move_board.move(0, '*') }
        result = valid_move_board.valid_move?(0)
        expect(result).to be true
      end
    end

    context 'when the column is full' do
      it 'returns false' do
        6.times { valid_move_board.move(0, '*') }
        result = valid_move_board.valid_move?(0)
        expect(result).to be false
      end
    end
  end

  context 'can return a pretty print string' do
    subject(:print_board) { described_class.new }

    context 'when the board is empty' do
      it 'returns an empty board' do
        board_check = <<~BOARD
           0 1 2 3 4 5 6
          ┏━┳━┳━┳━┳━┳━┳━┓
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┗━┻━┻━┻━┻━┻━┻━┛
        BOARD
        expect(print_board.to_s).to eq(board_check)
      end
    end
    context 'when the board has a token' do

      it 'returns a correct board' do
        white_token = '○'
        board_check = <<~BOARD
           0 1 2 3 4 5 6
          ┏━┳━┳━┳━┳━┳━┳━┓
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃○┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┗━┻━┻━┻━┻━┻━┻━┛
        BOARD
        print_board.move(0, white_token)
        expect(print_board.to_s).to eq(board_check)
      end
    end
    context 'when the board has several tokens' do
      it 'returns a correct board' do
        white_token = '○'
        black_token = '●'
        board_check = <<~BOARD
           0 1 2 3 4 5 6
          ┏━┳━┳━┳━┳━┳━┳━┓
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃
          ┃ ┃ ┃○┃ ┃ ┃ ┃ ┃
          ┃ ┃●┃●┃ ┃ ┃ ┃ ┃
          ┃○┃●┃○┃ ┃ ┃ ┃ ┃
          ┗━┻━┻━┻━┻━┻━┻━┛
        BOARD
        print_board.move(0, white_token)
        print_board.move(1, black_token)
        print_board.move(2, white_token)
        print_board.move(2, black_token)
        print_board.move(2, white_token)
        print_board.move(1, black_token)
        expect(print_board.to_s).to eq(board_check)
      end
    end
  end
end
