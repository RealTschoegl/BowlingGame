require 'rubygems'
require 'rspec'
require_relative 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

    context 'when only gutter balls are thrown' do
    it 'scores the game as 0' do
      20.times { game.roll(0) }

      expect(game.score).to eq(0)
    end
  end
end