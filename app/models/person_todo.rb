class PersonTodo < ActiveRecord::Base

  belongs_to :person
  belongs_to :todo
end
