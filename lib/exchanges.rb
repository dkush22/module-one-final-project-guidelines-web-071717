class Exchanges

attr_accessor :name, :id

@@all = []

def initialize(id = nil, name)
	@name = name
	@id = id
	@all << self
end

def self.all
	@@all
end


end