class Investors < ActiveRecord::Base
# has_and_belongs_to_many :stocks
has_many :stocks
has_many :exchanges, through: :stocks
# attr_accessor :name
# attr_reader :id


# def initialize(id = nil, name)
# 	@id = id
# 	@name = name
# end


end