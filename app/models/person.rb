class Person < ActiveRecord::Base

  has_many :person_todos
  has_many :todos, through: :person_todos

  def initialize(name:)
    super
    @name = name
  end

  def self.find_user(find_name)
    self.find_or_create_by(name: find_name)
  end

  def return_todos
    self.todos.map do |todo|
      # return_str = ''
      # return_str += todo.name + ''
      # return_str += todo.due_date ? todo.due_date.to_s : ''
      # return_str
      if todo.due_date
        "#{todo.name} #{todo.due_date}"
      else
        "#{todo.name}"
      end
    end
  end

  def add_todo(name)
    Todo.create(name: name, user: self)
  end


end
