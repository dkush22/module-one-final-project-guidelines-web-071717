class Person < ActiveRecord::Base

  has_many :person_todos
  has_many :todos, through: :person_todos, dependent: :destroy

  def initialize(name:)
    super
    @name = name
  end

  def self.find_user(find_name)
    new_person = self.find_or_create_by(name: find_name)
    new_person.get_zip if new_person.zip.nil?
    new_person.save
    new_person
  end

  def get_zip
    puts "what is your ZIP Code?"
    input = gets.chomp.to_i
    self.zip = input
  end

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
    self.todos.destroy(todo_hash[user].id)

    puts "Your task has been deleted."
    self.reload
  end

  def delete_completed(task)
    if task.status.downcase == "completed" || task.status.downcase == "complete" || task.status.downcase == "completed"
      self.todos.destroy(task.id)
    end
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
    delete_completed(todo_hash[user])
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
        if todo.people.length > 1
          todo.people.each do |person|
            puts "#{person.name} also has this task.\n" if person.name != self.name
          end
        end
      end
      puts "\nEnter any input to continue:\n"
      gets
    end
  end

  def all_people_minus_self
    all_people_m_self = Person.all - [self]
  end

  def show_users
    all_people_minus_self.each_with_index do |person, idx|
      puts "#{idx+1}: #{person.name}" unless person == self
    end
  end

  def add_user_to_new_todo(todo_add)
    puts "Add another user to todo?"
    input = gets.chomp.downcase
    if input == 'yes' || input == 'y'
      self.show_users
      puts "Enter the number of the user(s) to add: "
      user_choice = gets.chomp
      user_choice_array = user_choice.delete(" ").split(",")
      user_choice_array.each do |user_choice|
        self.all_people_minus_self[user_choice.to_i - 1].todos << todo_add
      end
    end
  end

end
