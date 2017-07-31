class Investors

attr_accessor :name
attr_reader :id

@@all = []

def initialize(id = nil, name)
	@id = id
	@name = name
	@@all << self
end

def self.all
	@@all
end


end