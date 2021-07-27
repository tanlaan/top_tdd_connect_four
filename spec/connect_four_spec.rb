# frozen_string_literal: true

require_relative '../lib/connect_four'

RSpec.describe ConnectFour do
  subject(:game_start) { described_class.new }

  context 'creates a board on initialization' do
    let(:start_board) { game_start.instance_variable_get(:@board) }

    it 'is not empty' do
      expect(start_board).not_to be_empty
    end

    it 'has a width of 7' do
      expect(start_board.length).to eq(7)
    end

    it 'has a height of 6' do
      expect(start_board[0].length).to eq(6)
    end
  end
end
