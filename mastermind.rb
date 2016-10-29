require "./master_module.rb"

class HumanGuess
  include MasterModule
  
  def initialize(code)
    @code = code
    play
  end
  
  def play
    
    until game_won? do
      # puts "---DEBUG---"
      # puts @code.inspect
      # puts "---DEBUG---"
      puts "\nEnter a combination of four colors with spaces in between."
      puts "purple, blue, red, green, orange, yellow"
      @guess = gets.chomp.split(" ")
      puts "Black Pegs: #{black_pegs}"
      puts "White Pegs: #{white_pegs - black_pegs}"
    end
    
  end
  
end

class Codes
  
  def initialize
    @colors = %w{blue yellow red purple orange green}
  end
  
  def human_guessor
    code = Array.new
    4.times do 
      code << @colors.sample
    end
    HumanGuess.new(code)
  end
  
end

Codes.new