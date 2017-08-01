class UpdateColumnNameTodos < ActiveRecord::Migration[4.2]
  def change
    rename_column :todos, :action, :description
  end
end
