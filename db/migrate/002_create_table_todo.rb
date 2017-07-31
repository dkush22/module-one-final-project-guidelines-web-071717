class CreateTableTodo < ActiveRecord::Migration[4.2]
  def change
      create_table :todos do |t|
        t.string :name
        t.datetime :due_date
        t.string :action
        t.string :status
        t.timestamps
    end
  end
end
