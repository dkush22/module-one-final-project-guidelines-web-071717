class Createfoodwines < ActiveRecord::Migration[5.0]
  def change
    create_table :food_wines do |t|
      t.integer :food_id
      t.integer :wine_id
    end
  end
end
