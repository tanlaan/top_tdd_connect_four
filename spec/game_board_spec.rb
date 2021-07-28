# frozen_string_literal: true

require_relative '../lib/game_board'

RSpec.describe GameBoard do
  subject(:start_board) { described_class.new }
  context 'creates a board on initialization' do
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

    it 'puts a token to the bottom of the row' do
      token = '*'
      move_board.move(0, token)
      expect(inner_board[0][5]).to eq(token)
    end

    it 'stacks tokens if column already has some' do
      token = '*'
      2.times { move_board.move(0, token) }
      expect(inner_board[0][4]).to eq(token)
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
end
