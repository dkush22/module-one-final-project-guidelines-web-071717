class Changecolumntype < ActiveRecord::Migration[5.0]
  def change
    rename_column :wines, :type, :color
  end
end
