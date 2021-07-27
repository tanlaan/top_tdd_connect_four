# frozen_string_literal: true

require_relative '../lib/game_board'

RSpec.describe GameBoard do
  subject(:start_board) { described_class.new }
  context 'creates a board on initialization' do
    it 'has a width of 7' do
      expect(start_board.width).to eq(7)
    end

    it 'has a height of 6' do
      expect(start_board.height).to eq(6)
    end
  end
end