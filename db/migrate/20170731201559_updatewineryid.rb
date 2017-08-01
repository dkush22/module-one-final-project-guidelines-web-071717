class Updatewineryid < ActiveRecord::Migration[5.0]
  def change
    rename_column :wines, :winer_id, :winery_id
  end
end
