# frozen_string_literal: true

require_relative '../lib/connect_four'

RSpec.describe ConnectFour do
  let(:playable_game) { ConnectFour.new }
  it 'can be played' do
    expect(playable_game).to respond_to :play
  end
end
