require_relative '../config/environment.rb'
require 'csv'
require 'faker'


150.times do 
	name = Faker::Name.name
	Investor.create(name: name)
end

300.times do 
	investor_num = rand(1..150)
	stock_num = rand(1..105)
	amount = rand(50..1000000)
	Investment.create(investor_id: investor_num, stock_id: stock_num, amount: amount)
end



exchanges = []
exchange_path = 'bin/exchange.csv'

CSV.foreach(exchange_path) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Exchange.create(name: row[1])
    exchanges << row[1]
end



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


