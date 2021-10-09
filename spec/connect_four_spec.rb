# frozen_string_literal: true

require_relative '../lib/connect_four'

RSpec.describe ConnectFour do
  let(:playable_game) { ConnectFour.new }
  it 'can be played' do
    expect(playable_game).to respond_to :play
  end
  let(:winnable_game) { ConnectFour.new }
  it 'can be won' do
    winnable_game_board = winnable_game.instance_variable_get(:@board)
    4.times { winnable_game_board.move(0, 'x') }
    expect(winnable_game.winner?).to be true
  end
  let(:not_winner) { ConnectFour.new }
  it "knows when one of the tokens isn't the same" do
    not_winner_board = not_winner.instance_variable_get(:@board)
    2.times { not_winner_board.move(0, 'x') }
    not_winner_board.move(0, 'o')
    2.times { not_winner_board.move(0, 'x') }
    expect(not_winner.winner?).to be false
  end
end
