require_relative '../config/environment.rb'

daniel = Investor.create(name: "Daniel")
luke = Investor.create(name: "Luke")
nyse = Exchange.create(name: "NYSE")
nasdaq = Exchange.create(name: "NASDAQ")
apple = Stock.create(name: "apple", sector: "technology", ticker: "AAPL")
mmm = Stock.create(name: "3M", sector: "industrials", ticker: "3M")

binding.pry