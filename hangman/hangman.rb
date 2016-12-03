require 'yaml'
class Game
  
  def initialize
    @word = get_word("dictionary2.txt")
    @guessed_letters = []
    @guesses_left = 8
    @display = "_" * (@word.length - 1)

  end
  
  def get_word(dictionary_file)
    words = Array.new
    File.open(dictionary_file).readlines.each do |word|
      words << word if word.length > 5 && word.length < 12
    end
    words.sample.upcase
  end
  
  def find_letter_in_word(guess)
    @word.split("").each_index.select { |i| @word[i] == guess }
  end
  
  def update_display(guess)
    indexes = find_letter_in_word(guess)
    indexes.each { |index| @display[index] = guess }
    @display.to_s
  end
  
  def get_input
    input = gets.chomp.upcase
    
    if input == "SAVE"
      save_game
    elsif input == "EXIT"
      exit_game
    else
      input
    end
  end

  def input_valid?(input)
    input.length == 1 && !@guessed_letters.include?(input)
  end
  
  def game_won?
    @display.chomp == @word.chomp
  end

  def save_game
    f = File.open("hangman_save.txt", "w")
    f.puts self.to_yaml
    f.close
    puts "ALERT: Game saved."
    play
  end
  
  def exit_game
    puts "Goodbye!"
    exit
  end
  
  def play
    
    # puts "---DEBUG---"
    # puts @word
    # puts "---DEBUG---"
    
    until game_won? or @guesses_left == 0
    
      puts @display.scan(/./).join(' ')
    
      puts "You have #{@guesses_left} guesses left."
      puts "You've guessed: #{@guessed_letters.inspect}"
    
      input = get_input
      
      until input_valid?(input)
        puts "Invalid guess."
        input = get_input
      end
      
      
      if !find_letter_in_word(input).empty?
        puts "There are #{find_letter_in_word(input).length} '#{input}'s!"
        @display = update_display(input)
      else
        @guesses_left -= 1
        @guessed_letters << input
        puts "Sorry, there are no '#{input}'s in the word."
      end
      
    end
      
    if game_won?
      puts "Congratulations, you're a winner! You've guessed: #{@word}"
    elsif @guesses_left == 0
      puts "I'm sorry, you were unable to guess: #{@word}"
    end
    
    
  end
  
end

puts "Welcome to Hangman!"
puts "Enter SAVE at any time to save the game."
puts "Enter EXIT at any time to exit."
puts "NEW or CONTINUE?"

game_selection = gets.chomp.upcase

if game_selection == "NEW"
  game = Game.new
  game.play
elsif game_selection == "CONTINUE"
  a = File.new("hangman_save.txt").readlines.join
  game = YAML.load(a)
  puts "ALERT: Game loaded."
  game.play
elsif game_selection == "EXIT"
  puts "Goodbye"
  exit
end