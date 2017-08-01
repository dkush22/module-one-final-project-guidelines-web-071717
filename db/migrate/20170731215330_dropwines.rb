class Dropwines < ActiveRecord::Migration[5.0]
  def change
    drop_table :wines
  end
end
