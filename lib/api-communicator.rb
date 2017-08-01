
require 'json'
require 'pry'
require 'httparty'

def get_all_wines_from_api
  all_wines = HTTParty.get('http://api.snooth.com/wines/?akey=dy7389zagljx71jjbykjwgwox0yviakytisjbzhfgv3rs73p&ip=192.168.3.103.&q=all')
  wine_hash = JSON.parse(all_wines.parsed_response)
  wine_data = wine_hash["wines"]
  binding.pry
  wine_data
end
