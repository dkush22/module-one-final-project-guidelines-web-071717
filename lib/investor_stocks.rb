class InvestorStocks

	attr_accessor :investor_id, :stock_id
	attr_reader :id

	@@all = []

	def initialize(id = nil, investor_id, stock_id)
		@id = id
		@investor_id = investor_id
		@stock_id = stock_id
		@@all << self
	end

	def self.all
		@@all
	end


end