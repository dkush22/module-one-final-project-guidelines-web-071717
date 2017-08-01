require 'pry'

class Food < ActiveRecord::Base

  has_many :wines, through: :foodwines

end
