require 'colorize'

class UserInteraction

  attr_accessor :method_list

  def initialize
    @method_list = YAML.load_file("config/method_list.yml")
  end

  def run
    puts the_simpsons_logo
    show_commands
    input = get_user_input
  end

  def message_list
    {
      welcome: "WELCOME!",
      help: "sorry no help here",
      invalid_input: "Sorry, that is not a valid command. Type 'help' to see a list of valid commands."
    }
  end

  def the_simpsons_logo
    <<-SIMPSONS
  ___(_)_ __ ___  _ __  ___  ___  _ __  ___ 
 / __| | '_ ` _ \\| '_ \\/ __|/ _ \\| '_ \\/ __|
 \\__ \\ | | | | | | |_) \\__ \\ (_) | | | \\__ \\
 |___/_|_| |_| |_| .__/|___/\\___/|_| |_|___/
                 |_|

    SIMPSONS
  end

  def show_commands
    puts "Enter one of the following commands:\n\n"
    rows = []
    puts "Usage: ".colorize(:yellow) + "<command> <subcommand> [<argument>, <value>]\n"
    puts "Sample:".colorize(:yellow)
    puts "\tcharacter".colorize(:light_green) + " find_by name lisa"
    puts "\tstats".colorize(:light_green) + " top_10_popular_episodes\n\n"
    self.method_list.each do |method_name, method_list|
      rows << [method_name.to_s.colorize(:light_blue), method_list[:description]]

      if method_list[:methods]
        method_list[:methods].each do |submethod_name, submethod_description|
          rows << ["  #{submethod_name.to_s.colorize(:magenta)}", submethod_description[:description]]
        end
      end
    end
    table = TTY::Table[*rows]
    puts table.to_s
  end

  # welcome the user and then print help message containing valid commands
  def welcome
    puts message_list[:welcome]
    # help
  end

  # take in user input
  def get_user_input
    input = gets.chomp
    parse_user_input(input)
  end

  def parse_user_input(input)
    possible_commands = input.split(" ")
    # command1 will always be (super)method

    # iff exists.....
    # command 2 will always be (sub)method
    # command 3 will always be attribute searched
    # command 4+ will always be value searched for


    # if command is empty
    if possible_commands.count == 0
      puts "Command empty, please try again:".colorize(:red )
      get_user_input

      # elsif command is exactly 'help'
    elsif possible_commands.count == 1
      if possible_commands[0] == "help"
        show_commands
        get_user_input
      elsif possible_commands[0] == "exit"
#---------add exit method here
      end

      # elsif command contains 2 words
    elsif possible_commands[0] && possible_commands[1]
      command1 = possible_commands[0].to_sym
      command2 = possible_commands[1].to_sym
      # params = possible_commands[2..-1]
      # binding.pry
      if method_list[command1][:methods][command2]
        class_name = method_list[command1][:methods][command2][:model]
        method_name = method_list[command1][:methods][command2][:method]

        class_name.to_s.singularize.capitalize.constantize.send(method_name)
        # can add params later
        # if command contains 3 words

        # if command contains 4 words

        # if longer command (i.e. searches for segments of lines)


      else
#-------throw error and return to help

      end
      # binding.pry
    end

  end

  # compare user input to method_list
  def get_method_from_input
    method_list.each do |method_category|
      method_category[:methods].keys.each do |method_name|
        # do comparison here?

      end
    end
  end

  # make call to query method based on user input
  def call_query

  end
end
