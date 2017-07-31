class CreateExchanges < ActiveRecord::Migration[5.0]
 has_many :stocks
 has_many :investors, through: :stocks
  def change
  	create_table :exchanges do |t|
  		t.string :name
  	end
  end
end
