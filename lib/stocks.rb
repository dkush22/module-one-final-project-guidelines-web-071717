class Stock < ActiveRecord::Base
  belongs_to :exchanges
  has_many :investor_stocks
  has_many :investors, :through => :investor_stocks
end