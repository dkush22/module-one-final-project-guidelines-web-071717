class Foodtable < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :food_type
    end
  end
end
