=begin
Suppose we could access yesterday's stock prices as an array, where:

The indices are the time in minutes past trade opening time, which was 9:30am local time.
The values are the price in dollars of Apple stock at that time.
So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.

Write an efficient method that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

For example:

  stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)

No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).
=end

# O(n^2)
def max_profit(stock_prices)
  result = 0
  stock_prices.each_with_index do |price, idx|
    next_idx = idx + 1
    while next_idx < stock_prices.length
      profit = stock_prices[next_idx] - price
      result = profit if profit > result 
      next_idx += 1
    end
  end
  result
end