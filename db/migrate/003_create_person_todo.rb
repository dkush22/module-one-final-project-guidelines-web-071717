class CreatePersonTodo < ActiveRecord::Migration[4.2]
  def change
    create_table :person_todos do |t|
      t.integer :person_id
      t.integer :todo_id
    end
  end
end
