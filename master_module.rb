module MasterModule
  
  def white_pegs
  
    pegs = 0
    temp = @code.dup
    
    @guess.each do |element|
      if temp.include? element
        pegs += 1
        index = temp.index(element)
        temp[index] = nil
        temp.compact
      end
    end
    pegs
  end

  def black_pegs
    pegs = 0
    @code.length.times do |index|
      if @guess[index] == @code[index]
        pegs += 1
      end
    end
    pegs
  end
    
  def game_won?
    @guess == @code
  end
end