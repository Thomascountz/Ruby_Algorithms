class Game
  
  attr_accessor :player
  
  def initialize(name)
    @player = Player.new(name)
    @board = Board.new
    @code = Code.new
    human_guessor_logic
  end
  
  def human_guessor_logic
    
    code = @code.create_code
    current_guess = nil
    puts "Please choose a combination of four of the following colors."
    puts "Notice: repeats are valid"
    puts "#{@code.code_elements}"
    
    until @board.num_of_turns == @board.allowed_turns or @board.game_won?(code, current_guess) do
      
      # puts "---DEBUG---"
      # puts "CODE: #{code.inspect}"
      # puts "GUESS: #{current_guess.inspect}"
      # puts "CURRENT TURN: #{@board.num_of_turns}"
      # puts "---DEBUG---"
      
      puts "\nPlease enter your guess.\n"
      current_guess = @player.guess
      if @player.guess_valid?(current_guess, @code.code_elements)
        puts "White Pegs: #{@board.white_pegs(code, current_guess)}"
        puts "Black Pegs: #{@board.black_pegs(code, current_guess)}"
        @board.num_of_turns += 1
      else
        puts "Invalid."
      end
    end
    
    if @board.game_won?(code, current_guess)
      puts "Congratulations, you solved it in #{@board.num_of_turns} turns!"
    elsif @board.num_of_turns == @board.allowed_turns
      puts "Sorry, you were unable to guess the code: #{code}."
    end
  end
    
  
  class Player
      
    attr_accessor :name
    
    def initialize(name)
      @name = name
    end
      
    def guess
      gets.chomp.downcase.split(" ")
    end
    
    def guess_valid?(guess, code_elements)
      guess.length == 4 && guess.all? { |element| code_elements.include? element }
    end
    
  end
  
  class Board
    
    attr_accessor :num_of_turns
    
    def initialize
      @num_of_turns = 0
    end
    
    def white_pegs(code, guess)
    
      pegs = 0
      temp = code.dup
      
      guess.each do |element|
        if temp.include? element
          pegs += 1
          index = temp.index(element)
          temp[index] = nil
          temp.compact
        end
      end
      pegs - black_pegs(code, guess)
    end
  
    def black_pegs(code, guess)
      pegs = 0
      code.length.times do |index|
        if guess[index] == code[index]
          pegs += 1
        end
      end
      pegs
    end
    
    def game_won?(code, guess)
      code == guess
    end
    
    def allowed_turns
      12
    end
    
  end
  
  class Code
    
    attr_reader :code_elements
    
    def code_elements
      %w(red blue yellow green purple orange)
    end
    
    def create_code
      code = Array.new
      4.times { code << code_elements.sample }
      code
    end
    
  end
  
end

Game.new("Thomas")