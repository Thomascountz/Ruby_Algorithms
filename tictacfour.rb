class Game
  
  attr_reader :board
  
  #initializes two Players, a Board, sets a current player, sets number_of_turns, and defines winning patterns
  
  def initialize(player_x, player_o)
    
    @player_x = Player.new(player_x, "X")
    @player_o = Player.new(player_o, "O")
    @board = Board.new
    @winning_patterns = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    @current_player = [@player_x, @player_o].sample
    @number_of_turns = 0  
    prompt

  end
  
  #checks to see if the game has been won based on winning patterns
  
    def game_won?
    
    winner = false
    @winning_patterns.each do |pattern|
      
      test_area = []
      pattern.each do |square|
        
        test_area << @board.play_area[square]
        
      end
      
      if test_area.all? {|sq| sq == "X"} or test_area.all? {|sq| sq == "O"}
        winner = true
        
      end
      
    end
    
    return winner
    
  end
  
  #checks to see if there are no more possible moves and the game is not won
  
  def game_tied?
    
    if @number_of_turns == 9
      return true
    else
      return false
    end
    
  end
  
  #alternates which player's turn it is
  
  def switch_player
    
    if @current_player == @player_o
      @current_player = @player_x
    else
      @current_player = @player_o
    end
    
    @number_of_turns += 1
  end
  
  #displays the game board to the terminal
  
  def display_board
    
    puts "\n---------------\n".center(5)
    @board.play_area[0..2].each { |square| print square.to_s.center(5)}
    puts "\n\n"
    @board.play_area[3..5].each { |square| print square.to_s.center(5)}
    puts "\n\n"
    @board.play_area[6..8].each { |square| print square.to_s.center(5)}
    puts "\n---------------\n".center(5)
    
  end
  
  #gets input from the user
  
  def get_input
    square = gets.chomp

    return input_valid?(square) ? square : false
  
  end
  
  #checks to see if the input is valid
  
  def input_valid?(input)
    
    begin
    input = Integer(input)
    rescue ArgumentError
      return false
    end
    
    return input.between?(0, 9) ? true : false
    
  end
  
  #sends input to update board
  
  def play(player_mark, position)
    
    @board.update_board(player_mark, position)
  
  end
  
  #puts prompts for the user and calls methods
  
  def prompt
    
    until game_won? or game_tied? do
      
      display_board
      puts "Player #{@current_player.name}, it's your turn!"
      puts "Please enter the numbered square where you'd like to player you #{@current_player.mark}"
      input_square = get_input
      
      until input_square and @board.is_clear?(input_square) do
          puts "Sorry, that's not an option. Try again!"
          input_square = get_input
      end
          
      play(@current_player.mark, input_square)
      switch_player
      
    end
    
    if game_tied? 
      display_board
      puts "GAME TIED!"
    else 
      switch_player
      display_board
      puts "#{@current_player.name.upcase} WINS THE GAME!"
    end
      
  end
  
end

class Player
  
  attr_reader :name, :mark
  
  #initializes Player with a name and mark attribute
  
  def initialize(name, mark) 
    @name = name
    @mark = mark
  end
  
end

class Board
  
  attr_reader :play_area
  
  #initializes a play_area array to use as the game board
  
  def initialize
    @play_area = Array(0..9)
  end
  
  #updates game board array element with player's X or O
  
  def update_board(mark, position)
      position = position.to_i
      
      @play_area[position] = mark
  
  end
  
  #checks to see if board postition is free to be marked
  
  def is_clear?(position)
    position = position.to_i
    
    @play_area[position] != "X" && @play_area[position] != "O" 

  end
  
end

puts "Let's play TicTacToe!"
puts "To start, enter the name of Player X: "
name_x = gets.chomp
puts "Now enter the name of Player O: "
name_o = gets.chomp
puts "Ok! Let's start!"
a = Game.new(name_x, name_o)