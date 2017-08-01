class Createnewwines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string  "name"
      t.string  "code"
      t.string  "region"
      t.string  "winery"
      t.string  "winery_id"
      t.string  "varietal"
      t.string  "price"
      t.string  "vintage"
      t.string  "color"
      t.string  "link"
      t.string  "tags"
      t.string  "image"
      t.string  "snoothrank"
      t.integer "available"
      t.integer "num_merchants"
      t.integer "num_reviews"
    end
  end
end
