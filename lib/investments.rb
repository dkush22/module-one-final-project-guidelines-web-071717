class Investment < ActiveRecord::Base
	belongs_to :stocks 
	belongs_to :investors 
end