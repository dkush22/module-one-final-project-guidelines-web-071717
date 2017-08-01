class Menu

  def welcome
    'Welcome. Please select an option:'
  end

  def self.find_user_instance
    puts "Please input your full name: "
    name = gets.chomp
    Person.find_user(name)
  end

  def find_todos
    self.todos
  end

  def runner
    welcome
    user = self.class.find_user_instance
    get_listing_choice(user)
  end

  def show_listing
    puts "1. Create todo"
    puts "2. Show todos"
    puts "3. Update todo"
    puts "4. Delete todo"
    puts "5. Exit"
  end

  def get_listing_choice(user)
    loop do
      show_listing
      puts
      puts "Enter a number: "
      input = gets.chomp.to_i
      case input
      when 1 then user.add_todo
      when 2 then user.due_by_days
      when 3 then user.update_todo
      when 4 then user.delete_todo
      when 5 then break
      end
    end
  end



end
