require_relative 'spec_helper'

describe 'Board' do
  before(:each) do
    @board = Board.new
  end

  describe '#play_area' do
    it 'is an array' do
      expect(@board.play_area).to be_a(Array)
    end
  end

  context 'updating the board with vaild input' do
    describe '#update_board' do
      it 'replaces an element in @play_area at an index' do
        @board.update_board('X', 3)
        expect(@board.play_area[3]).to eq('X')
      end
    end

    describe '#is_clear?' do
      it "returns 'true' if element at index is not 'X' or 'O'" do
        expect(@board.is_clear?(3)).to eq(true)
      end

      it "returns 'false' if element at index is 'X' or 'O'" do
        @board.play_area[3] = 'X'
        expect(@board.is_clear?(3)).to eq(false)
      end
    end
  end
end
