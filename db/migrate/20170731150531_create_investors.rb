class CreateInvestors < ActiveRecord::Migration[5.0]
  has_and_belongs_to_many :stocks
  has_many :exchanges, through: :stocks
  def change
  	create_table :investors do |t|
  		t.string :name
  	end
  end
end
