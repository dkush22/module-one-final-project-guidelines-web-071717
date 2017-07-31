class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
  	create_table :investors do |t|
  		t.string :name
  	end
  end
end
