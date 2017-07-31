class CreateStocks < ActiveRecord::Migration[5.0]
  belongs_to :exchanges
  has_and_belongs_to_many :investors
  def change
  	create_table :stocks do |t|
  		t.string :name
  		t.string :sector
  		#t.integer :exchange_id
  	end
  end
end
