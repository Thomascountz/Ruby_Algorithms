module Enumerable
    
    def my_each
        
        self.length.times do |index|
            yield(self[index])
            
        end
    	self
    end
    
    def my_each_with_index
    	
        self.length.times do |index|
            yield(self[index], index)
            
        end
    	self
    end    
    
    def my_select
    	
    	results = Array.new
    	
    	self.my_each do |element|
    		yield(element) ? results << element : nil
    	end
    	return results
    end
    
    def my_all?
    	
    	result = true
    	
    	self.my_each do |element|
    		yield(element) ? next : result = false 
    	end
    	result
    end 
    
    def my_any?
    	
    	result = false
    	
    	self.my_each do |element|
    		yield(element) ? result = true : next
    	end
    	result
    end
    
    def my_none?
    	
    	result = true
    	
    	self.my_each do |element|
    		yield(element) ? result = false : next
    	end
    	result
    end
    
    def my_count(value=nil)
    	
    	count = 0

	
		self.my_each {|n| yield(n) ? count += 1 : next } if block_given?

		self.my_each {|n| count += 1 if n == value} if value
	
		self.my_each {count += 1} unless block_given? or value
    	
    	count
    end
    
    def my_map
    	
    	results = Array.new
    	
    	self.my_each do |element|
    		results << yield(element)
    	end
    	results
    end
    
    def my_inject(init_value = nil)
    	
    	if init_value
    		result = init_value
    		self.my_each do |element|
    		result = yield(result, element)
    		end
    	else
    		result = self[0]
    		self[1..-1].my_each do |element|
    		result = yield(result, element)
    		end
    	end
    	
    	result
    end
    	
    def multiply_els ; self.my_inject {|result, element| result * element} ; end
    
end