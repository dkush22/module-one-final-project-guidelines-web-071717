require 'bundler'
Bundler.require
require_all 'app'
require 'date'
require 'json'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil
