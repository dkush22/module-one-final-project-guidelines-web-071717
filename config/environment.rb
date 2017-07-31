require 'bundler'
Bundler.require
require_all 'app'
require 'pry'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

# bob = Person.new(name: 'Bob')
# peter = Person.new(name: 'Peter')

# breakfast = Todo.new(name: 'breakfast')
# lunch = Todo.new(name: 'Lunch')

Pry.start
