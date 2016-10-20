LETTER_Z_ORD = 122
LETTER_A_ORD = 97
LETTERS_IN_THE_ALPHABET = 26

def c_cypher(text, shift_factor, encrypt=true)
	
	text = text.downcase.split("")
	shift_factor = shift_factor.to_i
	new_text = []
	
	text.each do |char|
		if char =~ /[\w]/
			
			if encrypt
				new_char = char.ord + shift_factor
			else
				new_char = char.ord - shift_factor
			end
			
			
			if new_char > LETTER_Z_ORD
				new_char -= LETTERS_IN_THE_ALPHABET
			
			elsif new_char < LETTER_A_ORD
				new_char += LETTERS_IN_THE_ALPHABET
			end
			
			new_char = new_char.chr
			new_text << new_char
			
		else
			new_text << char
		end
	end
	return new_text.join("")
end

puts "Text to encrypt?"
text_input = gets.chomp!

puts "Shift factor?"
shift_input = gets.chomp!

c_cypher(text_input, shift_input)