# GoogleBooks::Adapter.new.create_books_and_authors
#
# term = gets.chomp
# GoogleBooks::Adapter.new(term).create_books_and_authors

class Weather

  def self.retrieve(zip)

    OpenWeather::Adapter.new.get_weather(zip)

  end

end
