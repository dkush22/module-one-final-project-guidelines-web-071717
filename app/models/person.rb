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

  # def return_todos
  #   self.todos.map do |todo|
  #     if todo.due_date
  #       "#{todo.name} #{todo.due_date}"
  #     else
  #       "#{todo.name}"
  #     end
  #   end
  # end

  def add_todo
    new_todo = Todo.new
    self.todos << new_todo
    new_todo.save
    add_user_to_new_todo(new_todo)
  end

  def print_indexed_list
    todo_hash = {}
    self.todos.each_with_index do |todo, idx|
      todo_hash[idx+1] = todo
      puts "#{idx+1}. #{todo.name} : #{todo.description} Due by: #{todo.due_date.to_date.to_s}"
    end
    todo_hash
  end

  def delete_todo
    puts
    todo_hash = self.print_indexed_list
    puts
    puts "Please input the number of the task you want to delete."
    user = gets.chomp.to_i
    Todo.delete(todo_hash[user].id)

    puts "Your task has been deleted."
    self.reload
    # self.print_indexed_list
  end

  def update_todo
    todo_hash = self.print_indexed_list
    puts "Please input the number of the task you want to update"
    user = gets.chomp.to_i
    change_options = Todo.column_names - ["id", "created_at", "updated_at"]
    puts "Choose the number of the item you want to update."
    puts "Here are your options:"
    change_options.each_with_index do |option, idx|
      puts "#{idx+1}: #{option}"
    end
    user_to_sym = change_options[gets.chomp.to_i-1].to_sym
    puts "What do you want to change it to?"
    user_updated = gets.chomp
    Todo.update(todo_hash[user].id, user_to_sym => user_updated)
    self.reload
    self.print_indexed_list
  end

  def due_by_days
    puts "Input a number for next (x) days of tasks?"
    num_days = gets.chomp.to_i
    selected_todos = self.todos.select do |todo|
      todo.due_date != nil && todo.due_date <= Date.today + num_days && todo.due_date >= Date.today
    end
    create_numbered_list(selected_todos)
    puts '======================================'
    puts
  end

  def create_numbered_list(list)
    if list.empty?
      puts "\nYou have no todos.\n"
    else
      puts "\nYour todos are:"
      list.each_with_index do |todo, idx|
        puts "#{idx+1}. #{todo.name} : #{todo.description} Due by: #{todo.due_date.to_date.to_s}"
      end
      puts "\nEnter any input to continue:\n"
      gets
    end
  end

  def show_users
    Person.all.each_with_index do |person, idx|
      puts "#{idx+1}: #{person.name}" unless person == self
    end
  end


  # def add_user_to_todo
  #   todo_hash = self.print_indexed_list
  #   puts "Select a todo to add a user to:"
  #   input = gets.chomp.to_i
  #   self.class.show_users
  #   puts "Enter a user to add: "
  #   user_choice = gets.chomp.to_i
  #   Person.all[user_choice - 1].todos << [todo]
  # end

  def add_user_to_new_todo(todo_add)
    puts "Add another user to todo?"
    input = gets.chomp.downcase
    if input == 'yes' || input == 'y'
      self.show_users
      puts "Enter a user to add: "
      user_choice = gets.chomp.to_i
      Person.all[user_choice - 1].todos << todo_add
    end
  end

end
