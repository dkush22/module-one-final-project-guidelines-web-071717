require_relative '../config/environment.rb'
require 'csv'
 


# daniel = Investor.create(name: "Daniel")
# luke = Investor.create(name: "Luke")


exchanges = []
exchange_path = 'bin/exchange.csv'

CSV.foreach(exchange_path) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Exchange.create(name: row[1])
    exchanges << row[1]
end


# puts exchanges

stocks = []
stocks_path = 'bin/nyse.csv'
stocks_path2 = 'bin/nasdaq.csv'


CSV.foreach(stocks_path) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    stocks << row[1]
	Stock.create(exchange_id: 1, name: row[1], ticker: row[0], sector: row[3])
end

CSV.foreach(stocks_path2) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Stock.create(exchange_id: 2, name: row[1], ticker: row[0], sector: row[4])
    stocks << row[1]
end

binding.pry



# puts stocks