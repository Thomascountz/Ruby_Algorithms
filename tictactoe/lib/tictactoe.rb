require_relative 'game'

puts "Let's play TicTacToe!"
puts 'To start, enter the name of Player X: '
name_x = gets.chomp
puts 'Now enter the name of Player O: '
name_o = gets.chomp
puts "Ok! Let's start!"
a = Game.new(name_x, name_o)
