def stock_picker(prices)
	
	stock_prices = prices
	buy_day = 0 
	diff = 0
	buy_sell = [0,1]
	
	stock_prices.each do |buy_price|
		
		sell_day = buy_day
		
		(stock_prices.length - buy_day).times do
			
			sell_price = stock_prices[sell_day]
			
			if buy_price - sell_price < diff
				diff = buy_price - sell_price
				buy_sell[0] = buy_day
				buy_sell[1] = sell_day
			end
			
			sell_day += 1
		end
	
	buy_day += 1
	end
	
	buy_sell
end


stock_picker([17,3,6,9,15,8,6,1,10])