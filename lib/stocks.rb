class Stocks < ActiveRecord::Base
  belongs_to :exchanges
  has_many :investors
	# attr_accessor :name, :ticker, :exchange_id, :sector
	# attr_reader :id


	# def initialize(id = nil, name, ticker, exchange_id, sector)
	# 	@id = id
	# 	@name = name
	# 	@ticker = ticker
	# 	@exchange_id = exchange_id
	# 	@sector = sector
	# end


end