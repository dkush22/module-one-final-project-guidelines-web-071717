class Person < ActiveRecord::Base

  has_many :person_todos
  has_many :todos, through: :person_todos, dependent: :destroy

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
    new_todo = Todo.create(name: name, user: self)
    self.todos << new_todo
  end

  def delete_todo
    todo_hash = {}
    self.todos.each_with_index do |todo, idx|
      todo_hash[idx+1] = todo
      puts "#{idx+1}. #{todo.name}"
    end

    puts "Please input the number(s) of the task you want to delete."
    user = gets.chomp.to_i
    Todo.delete(todo_hash[user].id)
    puts "Your task has been deleted."
    puts self.todos
  end


end
