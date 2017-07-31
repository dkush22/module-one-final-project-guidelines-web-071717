class Menu

  def runner

  end

  def welcome
    'Welcome. Please select an option:'
  end

  def self.find_user_instance
    puts "Please input your name: "
    name = gets.chomp
    Person.find_user(name)
  end

  def find_todos
    self.todos
  end



end
