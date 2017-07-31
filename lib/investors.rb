class Investor < ActiveRecord::Base
	has_many :investments
	has_many :stocks, :through => :investments
end