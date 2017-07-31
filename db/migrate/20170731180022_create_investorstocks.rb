class CreateInvestorstocks < ActiveRecord::Migration[5.0]
  def change
  	create_table :investor_stocks do |t|
  		t.belongs_to :investor
  		t.belongs_to :stock
  	end
  end
end
