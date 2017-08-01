require 'pry'

class Wine < ActiveRecord::Base

  has_many :foods, through: :foodwines

  def self.save_data_from_api
    all_wines = HTTParty.get('http://api.snooth.com/wines/?akey=dy7389zagljx71jjbykjwgwox0yviakytisjbzhfgv3rs73p&ip=192.168.3.103.&n=100')
    wine_hash = JSON.parse(all_wines.parsed_response)
    wine_data = wine_hash["wines"]
    wines = wine_data.map do |line|
      line["color"] = line["type"]
      w = Wine.find_or_create_by(line.except"type", "msrp")
    end
    wines
  end




end
