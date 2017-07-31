class Exchanges < ActiveRecord::Base
 has_many :stocks
 has_many :investors, through: :stocks
# attr_accessor :name
# attr_reader :id


# def initialize(id = nil, name)
# 	@name = name
# 	@id = id
# end


end