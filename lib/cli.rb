def greet
    puts "Welcome to our Investment Database Application! Here you can find information on the top stocks & investors on five of the world's biggest exchanges!" 
end

def gets_user_input
    puts "Find out more information about an Exchange or a Stock. Enter 'Exchange' or 'Stock' to find out more"

    input = gets.chomp.downcase

    cond = false

    if input == "stock"
        return input 
    elsif input == "exchange"
        return input
    end

    until cond == true
        puts "Unexpected input. Please enter 'Exchange' or 'Stock' to research their data"
        input = gets.chomp.downcase
         if input == "stock"
            cond == true
            return input 
        elsif input == "exchange"
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
        puts "You chose exchanges! Enter an exchange name."
        input = gets.chomp
        exchange_data = search_for_exchange(input)
    end
end

def search_for_stock(searchVal)
     val = Stock.find do  |stock| 
        stock.ticker.upcase == searchVal || stock.name.include?(searchVal)
    end
    val
end

def search_for_exchange(searchVal)
    val = Exchange.find do |exchange| 
        exchange.name.include?(searchVal)
    end
    val
end

def find_exchange(stock)
    val = Exchange.find do |exchange|
        exchange.id == stock.exchange_id
    end
    val.name
end

def get_total_investment(stock)
    val = 0
    Investment.all.each do |inv|
        # binding.pry
        if stock.id == inv.stock_id
            # binding.pry
            val += inv.amount
        end
    end
    val
end

def get_largest_investor(stock)
    arr = []
    new_array = []

    Investment.all.each do |inv|
        if stock.id == inv.stock_id
            arr << inv
        end
    end

    amt_arr = []
    arr.each do |inv|
        amt_arr << inv.amount
    end

    max_val = amt_arr.max 

    max_investment = arr.find do |inv|
        max_val == inv.amount 
    end

    val = Investor.find do |investor|
        max_investment.investor_id == investor.id
    end

    returnArr = [val.name, max_investment.amount]
end

def learn_exchange(exchange)


end

def learn_stock(stock)
    name = find_exchange(stock)
    puts "You selected #{stock.name}. The ticker for this stock is #{stock.ticker}. This stock is on the #{name}!"
    puts ""

    #Q1
    puts "Would you like to see the total investment in this stock? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        puts "The total invesment of #{stock.name} is $#{get_total_investment(stock)}."
    end

    #Q2
     puts "Would you see which person has the most equity in this stock? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        arr = get_largest_investor(stock)
        puts "The biggest investor of #{stock.name} is #{arr[0]} with an invesment of $#{arr[1]}."
    end


end




def goodbye
    puts "Thank you for using the application! We hope it was useful!"
end



def run 
    greet
    topic = gets_user_input
    result = research_topic(topic)

    if result.class == Exchange 
        learn_exchange(result)
    elsif result.class == Stock
        learn_stock(result)
    end


    # goodbye

end
