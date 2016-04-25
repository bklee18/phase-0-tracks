# initialize empty hash
# ask appropriate questions and make sure inputs are the right values
# ask if any revisions are to be made
# make sure revision inputs also are the correct data types


def questionnaire

  puts "What is the client's name?"

  client_info = {}

  client_info[:name] = gets.chomp.to_s

  puts "How many children does the client have?"

  client_info[:children] = gets.chomp.to_i

  puts "Which decor theme does the client prefer?"

  client_info[:theme] = gets.chomp.to_s

  puts "Is the client is willing to pay? (y/n)"

  canpay = gets.chomp

  client_info[:willingtopay] = canpay

    if canpay == "y"
    	client_info[:willingtopay] = true
    else
    	client_info[:willingtopay] = false
    end

  puts "Below is a review of client info. Would you like to change anything? If not, type none."

  client_info.each {|key, value| puts "#{key}: #{value}" }
  
  symbol = gets.chomp
  
     if symbol == "none"
        puts "You are finished"
     end
  
  symbol = symbol.to_sym
  
      if client_info.has_key?(symbol)
       puts "Please enter new information"
       puts "#{symbol.to_s}:"
  
        if symbol.to_s == "name"
  	       value = gets.chomp
           vulue = value.to_s
           client_info[symbol] = value
        end
  
        if symbol.to_s == "children"
        	value = gets.chomp
        	value = value.to_i
          client_info[symbol] = value
        end
  
        if symbol.to_s == "theme"
        	value = gets.chomp
        	value = value.to_s
        	client_info[symbol] = value
        end
  
        if symbol.to_s == "willingtopay"
        	value = gets.chomp
        	value = value.to_s
          	if value == "y"
	             client_info[symbol] = true
	          else
	             client_info[symbol] = false
	          end
        end
      end

  puts "Below is a review of client info"		

  puts client_info.each {|key, value| puts "#{key}: #{value}" }

end  

questionnaire