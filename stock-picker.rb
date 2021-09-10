appl = [17,3,6,9,15,8,6,1,10]
ge = [20, 20, 19, 15, 14, 13, 12, 5, 4, 1]
gme = Array.new(10) { |i| i + rand(5..419)}

# Remark: You have to buy and sell the stock. Big paper hand energy!

# My naive solution: 
# Check day 1 price and keep track of the profits for selling on different days up to the last day.
# Keep track of the day pairs with the max profit and update accordingly.
# Then check day 2 price and keep track of the profits for selling on different days.
# Keep going until you get to the last day, which could be the best day to buy a sell.

def stock_picker(stock_prices)
	max_profit = -1
	last_index = stock_prices.length - 1
	ideal_index_pair = []
	# trying my best to NOT use a for loop
	stock_prices.each_index do |buy_index|
		buy_index.upto(last_index) do |sell_index|
			if stock_prices[sell_index] - stock_prices[buy_index] > max_profit
				max_profit = stock_prices[sell_index] - stock_prices[buy_index];
				ideal_index_pair = [buy_index, sell_index]
			end
		end
	end
	# Days start at 0
	return ideal_index_pair
end

print stock_picker(appl)
# [1, 4]
print stock_picker(ge)
# [0, 0]
