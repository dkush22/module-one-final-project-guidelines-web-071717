class Todo < ActiveRecord::Base

  has_many :person_todos
  has_many :people, through: :person_todos

  def initialize(status: "In progress")
    super
    @name = self.set_name
    @due_date = self.set_due_date
    @status = status
    @description = self.set_description
  end


  def set_due_date
    puts "In how many days time do you want this to be due?"
    due_date = gets.chomp.to_i
    self.due_date = Date.today + due_date
  end

  def set_name
    puts "What is the name of your task?"
    name = gets.chomp
    self.name = name
  end

  def set_description
    puts "What is the description of your task?"
    description = gets.chomp
    self.description = description
  end

  def self.clean_up
    Todo.all.each do |todo|
      if todo.people.empty? || todo.due_date < Date.today
        Todo.destroy(todo.id)
      end
    end
  end

end
