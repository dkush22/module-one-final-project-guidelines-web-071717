class Investor_stock < ActiveRecord::Base
	belongs_to :stocks 
	belongs_to :investors 
end