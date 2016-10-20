h_dict = ["he", "hello", "helicopter", "helium", "hel"]


def substring(input, dictionary)
	text = input.downcase.split(" ")
	dict = dictionary
	count = Hash.new(0)
	
	text.each do |text_word|
		dict.each do |word|
			if text_word.include?(word)
				count[word] += 1 
			end
			
		end
		
	end
	
	count
	
end

substring("Help Helen drink heliums", h_dict)