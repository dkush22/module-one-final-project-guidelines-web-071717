require 'bundler'
Bundler.require
require_all 'app'
require 'pry'
require 'date'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
