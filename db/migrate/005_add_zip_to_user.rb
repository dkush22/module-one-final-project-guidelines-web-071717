class AddZipToUser < ActiveRecord::Migration
  def change
    add_column :people, :zip, :integer
  end
end
