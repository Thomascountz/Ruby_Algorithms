# def bubble_sort(array)
    
#     sorted_array = array
#     switch = true
    
#     until switch == false do
        
#         switch = false
        
#         sorted_array.each_with_index do |element, index|
#             if (sorted_array[index] <=> sorted_array[index + 1]) == 1
#               sorted_array[index], sorted_array[index + 1] = sorted_array[index + 1], sorted_array[index]
#               switch = true
#             end
            
#         end
    
#     end

#     return sorted_array
# end


def bubble_sort(array)
    return bubble_sort_by(array) {|left, right| left - right}
end

def bubble_sort_by(array)
    
    sorted_array = array
    switch = true
    
    until switch == false 
    
    	switch = false
	    
	    sorted_array.length.times do |index|
	    	
	        left = sorted_array[index] 
	        sorted_array[index + 1] ? right = sorted_array[index + 1] : break
	       	
	       	if yield(left, right) > 0 
	        sorted_array[index], sorted_array[index + 1] = sorted_array[index + 1], sorted_array[index]
			switch = true
	       	end
        end
    end
    sorted_array
end
