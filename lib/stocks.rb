class Stocks

	attr_accessor :name, :ticker, :exchange_id, :sector
	attr_reader :id

	@@all = []

	def initialize(id = nil, name, ticker, exchange_id, sector)
		@id = id
		@name = name
		@ticker = ticker
		@exchange_id = exchange_id
		@sector = sector
		@@all << self
	end


	def self.all
		@@all
	end


end