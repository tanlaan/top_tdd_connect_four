# frozen_string_literal: true

require_relative '../lib/connect_four'

RSpec.describe ConnectFour do
  subject(:game_start) { described_class.new }
  context 'create a gameboard on startup' do
    let(:start_board) { game_start.instance_variable_get(:@board) }
    it 'is not empty' do
      expect(start_board).to exist
    end
  end
end
