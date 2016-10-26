 module PegModules
    #returns the number of times a guess element and a code element appear at different indexes 
    
    def white_pegs
  
      count = 0
      
      @guess.each do |element|
        count += 1 if @code.include? element
      end
      
      count
  
    end
    
    #returns the numnber of times a guess element is at the same index as the same code element
    
    def black_pegs
      
      count = 0
      
      4.times do |index|
      count += 1 if @guess[index] == @code[index]
      index += 1
      end
    
      count
      
    end
    
  #returns true when the guess array is the same as the code array
  
  def game_won?
    @guess == @code
  end
  
end