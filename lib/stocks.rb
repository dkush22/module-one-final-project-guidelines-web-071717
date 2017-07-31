class Stock < ActiveRecord::Base
  belongs_to :exchanges
  has_many :investments
  has_many :investors, :through => :investments
end