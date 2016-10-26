require './peg_modules.rb'

class CodeGenerator
  
  #calls create_call when instantized and defines colors array
  
  def initialize
    
    @colors = %w{purple blue red green orange yellow}
    ask
    
  end
  
  def ask
    puts "[creator] or [guessor]?"
    input = gets.chomp.downcase
    if input == "creator"
      get_code
    else
      comp_create_code
    end
  end
  
  #computer creates a code array of 4 randmonly sampled color elements
  
  def comp_create_code
    code = Array.new
    4.times { code << @colors.sample }
    HumanGuess.new(code)
  end
  
  #gets code from user
  
  def get_code
    puts "To create code, input a series of four colors separeated by spaces"
    puts "[purple], [blue], [red], [green], [orange], [yellow]"
    code = gets.chomp
    hum_create_code(code)
  end
  
  #stores user input as a code array and calls AI class
  
  def hum_create_code(code)
    code = code.split(" ")
    AI.new(code)
  end
  
end


class HumanGuess
  
  include PegModules
  
  #initializes a guess array, and sets 12 turns
  
  def initialize(code)
    @turns = 12
    @code = code
    play
  end
  
  #prompts user and runs game logic
  
  def play
    
    until game_won? do
      puts "\nEnter a combination of four colors with spaces in between."
      puts "purple, blue, red, green, orange, yellow"
      guess = gets.chomp.downcase
      @guess = guess.split(" ")
      

      puts "white pegs: #{white_pegs - black_pegs}"
      puts "black pegs: #{black_pegs}"
      # puts "----DEBUG----"
      # puts "guess: #{@guess.inspect}"
      # puts "code: #{@cg_code.code.inspect}"
      # puts "----DEBUG----"
    end
    
  end
  
  
end

class AI
  
  include PegModules
  
  #stores the code and initializes the first guess and the color array
  
  def initialize(code)
    @code = code
    @colors = %w{purple blue red green orange yellow}
    play
  end
  
  def play
    @guess = Array.new
    4.times { @guess << @colors.sample }
    @guess
    puts "white pegs: #{white_pegs - black_pegs}"
    puts "black pegs: #{black_pegs}"
    
    
    # until game_won?
    
    #AI STUFF
    
    
    # end
  end
  
end

a = CodeGenerator.new

