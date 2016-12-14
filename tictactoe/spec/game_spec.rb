require_relative 'spec_helper'

describe 'Game' do
  before(:each) do
    first_player = double('player_x')
    second_player = double('player_o')

    allow(first_player).to receive(:name)  { 'Thomas' }
    allow(first_player).to receive(:mark)  { 'X' }
    allow(second_player).to receive(:name) { 'Chris' }
    allow(second_player).to receive(:mark) { 'O' }

    @game = Game.new(first_player, second_player)
  end

  context 'when a player wins' do
    describe '#game_won?' do
      it "returns true if the top row is of all X's" do
        @board.play_area = ['X', 'X', 'X', 3, 4, 5, 6, 7, 8, 9]
        silence_stream(STDOUT) do
          expect(game_won?).to be true
        end
      end
    end
  end
end
