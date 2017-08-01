require 'csv'
require 'faker'


200.times do 
	name = Faker::Name.name
	Investor.create(name: name)
end

1600.times do 
	investor_num = rand(1..200)
	stock_num = rand(1..256)
	amount = rand(50..1000000)
	Investment.create(investor_id: investor_num, stock_id: stock_num, amount: amount)
end



exchanges = []
exchange_path = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/exchange.csv'

CSV.foreach(exchange_path) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Exchange.create(name: row[1])
    exchanges << row[1]
end



stocks = []
stocks_path = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/nyse.csv'
stocks_path2 = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/nasdaq.csv'
stocks_path3 = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/london_exchange.csv'
stocks_path4 = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/toronto_exchange.csv'
stocks_path5 = '/Users/flatironschool/Development/Projects/module-one-final-project-guidelines-web-071717/db/ASX.csv'



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

CSV.foreach(stocks_path3) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Stock.create(exchange_id: 3, name: row[1], ticker: row[0], sector: row[2])
    stocks << row[1]
end

CSV.foreach(stocks_path4) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Stock.create(exchange_id: 4, name: row[0], ticker: row[1], sector: row[2])
    stocks << row[1]
end

CSV.foreach(stocks_path5) do |row|
    # Where row[i] corresponds to a zero-based value/column in the csv
    Stock.create(exchange_id: 5, name: row[0], ticker: row[1], sector: row[2])
    stocks << row[1]
end

binding.pry