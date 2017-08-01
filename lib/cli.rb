def greet
    puts "Welcome to our Investment Database Application! Here you can find information on the top stocks & investors on five of the world's biggest exchanges!" 
end

def gets_user_input
    puts "Find out more information about an Exchange, a Stock, or an Investor. Enter 'Exchange', 'Stock', or 'Investor' to find out more"

    input = gets.chomp.downcase

    cond = false

    if input == "stock"
        return input 
    elsif input == "exchange"
        return input
    elsif input == 'investor'
        return input
    end

    until cond == true
        puts "Unexpected input. Please enter 'Exchange', 'Stock', or 'Investor' to research their data"
        input = gets.chomp.downcase
         if input == "stock"
            cond == true
            return input 
        elsif input == "exchange"
            cond == true
            return input
        elsif input == 'investor'
            cond == true
            return input
        end
    end

end

def research_topic(topic)
    if topic == "stock"
        puts "You chose stocks! Enter the ticker or company name."
        input = gets.chomp
        stock_data = search_for_stock(input)
    elsif topic == "exchange"
        
    elsif topic == 'investor'
        
    end
end

def search_for_stock(stock)
    sql = <<-SQL 
        SELECT * FROM stocks WHERE name = ? OR ticker = ?
    SQL 
    vals = connection.execute(sql, stock, stock)
end





def run 
    greet
    topic = gets_user_input
    research_topic(topic)
end