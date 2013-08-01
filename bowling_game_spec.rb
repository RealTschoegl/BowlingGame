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

    context 'when one pin is knocked down on each roll' do
      it 'scores the game as 20' do
        20.times { game.roll(1) }
        expect(game.score).to eq(20)
      end
    end


    context 'when a spare is thrown' do
      it 'records the frame score as 10 plus the number of pins knocked down in the next roll' do
        3.times  { game.roll(5) }
        17.times { game.roll(0) }

        expect(game.score).to eq(20)
      end
    end

    context 'when a strike is thrown' do
      it 'records the frame score as 10 plus the total number of pins knocked down in the next two rolls' do
        game.roll(10)
        game.roll(7)
        game.roll(1)
        16.times { game.roll(0) }
        
        expect(game.score).to eq(26)
      end
    end

    # context 'when a perfect game is rolled' do
    #   it 'scores the game as 300' do
    #     12.times { game.roll(10) }
        
    #     expect(game.score).to eq(300)
    #   end
    # end
  end
end