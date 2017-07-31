class Todo < ActiveRecord::Base

  has_many :person_todos
  has_many :people, through: :person_todos

  def initialize(name:, due_date: nil, status: nil, user:)
    super
    @name = name
    @due_date = due_date
    @status = status
  end

end
