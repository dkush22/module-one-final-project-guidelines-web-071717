def greet
    puts "Welcome to our Investment Database Application! Here you can find information on the top stocks & investors on five of the world's biggest exchanges!"
end

def gets_user_input
    puts "Find out more information about an Exchange or a Stock. Enter" + " 'Exchange'".bold.blue + " or" + " 'Stock'".bold.blue + " to find out more. If you would like to exit the application enter" + " 'Exit'".bold.red

    input = gets.chomp.downcase

    cond = false
    if input == "exit"
        exit
    elsif input == "stock"
        return input 
    elsif input == "exchange"
        return input
    end

    until cond == true
        puts "Unexpected input.".bold.red + " Please enter" + " 'Exchange'".bold.blue + " or" + "'Stock'".bold.blue + " to research their data or enter" + " 'Exit'".bold.red + " to exit the application"
        input = gets.chomp.downcase
         if input == "exit"
        exit
         elsif input == "stock"
            cond == true
            return input 
        elsif input == "exchange"
            cond == true
            return input
        end
    end

end

def research_topic(topic)
    cond = false

    
    if topic == "stock"
        puts "You chose stocks! Enter the ticker or company name. Enter 'help' for a list of companies and their tickers."
        input = gets.chomp
        stock_data = search_for_stock(input)
        if input == "help"
            help_stocks
        end
        if stock_data != nil
            cond = true
            return stock_data
        end
    elsif topic == "exchange"
        puts "You chose exchanges! Enter an exchange name. Enter 'help' for a list of the valid exchanges."
        input = gets.chomp.split.map(&:capitalize).join(' ')
        exchange_data = search_for_exchange(input)
        if input == "Help" || input == 'help'
            help_exchanges
        end
        if exchange_data != nil
            cond = true
            return exchange_data
        end
    end

    until cond == true
        if topic == "stock"
            if input == 'help'
                puts "Enter the ticker or company name. Enter 'help' for a list of companies and their tickers."
            else
                puts "Unexpected input! Enter the ticker or company name. Enter 'help' for a list of companies and their tickers."
            end
                
            input = gets.chomp
            stock_data = search_for_stock(input)
            if input == "Help" || input == 'help'
                help_stocks
            end
            if stock_data != nil
                cond = true
                return stock_data
            end
            
        elsif topic == "exchange"
            if input == "Help" || input == 'help'
                puts "You chose exchanges! Enter an exchange name. Enter 'help' for a list of the valid exchanges."
            else
                puts "Unexpected input! Enter an exchange name. Enter 'help' for a list of the valid exchanges.".colorize(:red)
            end

            input = gets.chomp
            exchange_data = search_for_exchange(input)
            if input == "Help" || input == 'help'
                help_exchanges
            end
            if exchange_data != nil
                cond = true
                return exchange_data
            end
        end
    end


end

def search_for_stock(searchVal)
     val = Stock.find do  |stock| 
        stock.ticker.upcase == searchVal.upcase || stock.name.include?(searchVal) || stock.name.include?(searchVal.split.map(&:capitalize).join(' ')) || stock.name.include?(searchVal.upcase)
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

def print_stocks(exchange)
    Stock.all.each do |stock|
        puts "#{stock.name}" if stock.exchange_id == exchange.id
    end
end


def get_total_investment(stock)
    val = 0
    Investment.all.each do |inv|
        if stock.id == inv.stock_id
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

def get_like_sector(stock)
    Stock.all.each do |s| 
        puts "#{s.name}" if s.sector == stock.sector && stock.name != s.name
    end
end

def total_capital_in_exchange(exchange)
    total = 0
    Stock.all.each do  |stock|
        if stock.exchange_id == exchange.id
            total += get_total_investment(stock)
        end
    end
    total
end

def get_largest_stock_in_exchange(exchange)

    #get stocks in this exchange
    arr = []
    Stock.all.each do |stock|
        arr << stock if stock.exchange_id == exchange.id
    end

    max_stock = {:stock => nil, :amount => nil}

    arr.each do |stock|
        val = get_total_investment(stock)
        if max_stock[:stock] == nil || max_stock[:amount] < val 
            max_stock[:stock] = stock
            max_stock[:amount] = val 
        end
    end
    max_stock 
end

def learn_exchange(exchange)
    puts "You selected the #{exchange.name}."
    puts ""

    puts "Would you like to see all of the stocks on this exchange? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        puts "The stocks on the #{exchange.name} are:"
        print_stocks(exchange)
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"
    end
    puts "Would you like to see the total amount of capital invested in this exchange? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        puts "Total amount invested in the #{exchange.name} is $#{total_capital_in_exchange(exchange)}"
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"
    end
    puts "Would you like to find the stock with highest market cap in this exchange? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        result = get_largest_stock_in_exchange(exchange)
        puts "The stock with the highest market cap is #{result[:stock].name} totaling $#{result[:amount]}"
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"
    end
end

def help_stocks
    puts "The stock tickers and names in this database are:"
    Stock.all.each do |stock |
        puts "#{stock.ticker} : #{stock.name} "
    end
end 

def help_exchanges
    puts "The exchange in this database are:"
    Exchange.all.each do |ex|
        puts "#{ex.name}"
    end
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
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"
    end

    #Q2
     puts "Would you see which person has the most equity in this stock? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        arr = get_largest_investor(stock)
        puts "The biggest investor of #{stock.name} is #{arr[0]} with an invesment of $#{arr[1]}."
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"
    end

    #Q3

    puts "#{stock.name} is in the #{stock.sector} sector. Would you like to see other stocks in this sector? 'y' or 'n'"
    input = gets.chomp.downcase
    if input == "y"
        get_like_sector(stock)
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"

    end

    #Q4
        puts "Would you like to see the daily trading data for #{stock.name}?"
    input = gets.chomp.downcase
    if input == "y"
        request(stock.ticker)
        puts ""
    elsif input == "n"
    else puts "This is not a valid input"

    end



    puts "To find out more about this stock, go to https://www.cnbc.com/quotes/?symbol=#{stock.ticker}"

    puts ""

    puts ""


end

def request(ticker)


    uri = URI("https://services.last10k.com/v1/company/" + ticker + "/quote")

    request = Net::HTTP::Get.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = "b6bad9006c254c91bec10dc0cfc5ed99"
    # Request body
    request.body = "{body}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    response.body
    data = JSON.parse(response.body)
    data.each do |k, v|
        puts "#{k}: #{v}"
    end
end



def goodbye
    puts "Thank you for using the application! We hope it was useful!"
end



def run 
    greet

    #request(stock.ticker)


    cond = false
    
    until cond == true
        topic = gets_user_input
        result = research_topic(topic)
        if result.class == Exchange 
            learn_exchange(result)
        elsif result.class == Stock
            learn_stock(result)
        end
        puts "Would you like to research another Stock/Exchange? 'y' or 'n' "
        input = gets.chomp.downcase
        if input == 'n'
            cond = true
        end
    end

    goodbye

end
