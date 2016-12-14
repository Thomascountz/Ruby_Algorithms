class Board
  attr_reader :play_area

  # initializes a play_area array to use as the game board

  def initialize
    @play_area = Array(0..9)
  end

  # updates game board array element with player's X or O

  def update_board(mark, position)
    position = position.to_i

    @play_area[position] = mark
  end

  # checks to see if board postition is free to be marked

  def is_clear?(position)
    position = position.to_i

    @play_area[position] != 'X' && @play_area[position] != 'O'
  end
end
