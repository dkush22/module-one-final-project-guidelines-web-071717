class Investor < ActiveRecord::Base
	has_many :investor_stocks
	has_many :stocks, :through => :investor_stocks
end