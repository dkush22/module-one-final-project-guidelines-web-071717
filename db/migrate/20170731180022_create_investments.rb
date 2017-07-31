class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
  	create_table :investments do |t|
  		t.belongs_to :investor
  		t.belongs_to :stock
  		t.integer :amount
  	end
  end
end
