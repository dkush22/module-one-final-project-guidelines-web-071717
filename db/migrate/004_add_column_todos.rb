class AddColumnTodos < ActiveRecord::Migration[4.2]
  def change
    add_column :todos, :user, :string
  end
end
