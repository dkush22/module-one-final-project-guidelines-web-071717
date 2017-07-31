class Stocks

attr_accessor :name, :ticker, :exchange, :sector
attr_reader :id

@@all = []

def initialize(id = nil, name, ticker, exchange, sector)
@id = id
@name = name
@ticker = ticker
@exchange = exchange
@sector = sector
@@all << self
end


def self.all
	@@all
end


end