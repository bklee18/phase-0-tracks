#Made by Nadav & Cyzar

# The data structure is going to be two different arrays, one for product names, one for quantities.
# We will be responsible coders and make sure to keep them in-sync, so if one used (for anything other than quantity alteration) the other will be used too. 

# We will use two different methods to populate the arrays, because product array gets data,
# while the other array (quantity) just need to be of matching length and to be set to default value of 1
# We will make sure to use them both at the same time so that they will be of matching length.

# Method to create a product list (1/2)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: convert initial input to array by targeting the spaces between the items
# output: returns an array

# Method to create a quantity list (2/2)
# input: an array of items
# steps: convert all items in array to 1 (which is the default value of quantity)
# output: returns an array

# We will use the following method to alter both arrays (products and quantities)
# We will always use this on both of the arrays as to avoid mismatching user facing list (the list presented to the use) 
# This is possible because we can leverage the fact that to the user it looks the same as a singular list that contains both values.
# Method to add an item to a list
# input: relevant array and item needed to be added to it
# steps: see output
# output: returns array with the new item added to its end (as the last item on the list)

# Similar to add item, we will use one method to modify both arrays
# Method to remove an item from the list
# input: relevant array and index location of item that needs to be removed 
# steps: see output
# output: returns altered array (after the referred location was removed)

# To update the quantity of an item we will simply ask the user relevant questions
# Such as what to alter, display the list and perform the change  

# Method to print a list and make it look pretty
# input: two arrays, one with products names, one with quantities
# steps: run over the array (length wise..) print everything in a nice format
# steps: we will try to break down the printing to make it look like a chart
# output: a very nice chart with some values centered to middle 

#note about "\e[H\e[2J"
#we looked how to make nice interface, in any modern application (ms word for example)
#when you change your view, like open a menu and then moves to another menu, the screen sort of clears
#to give a better example, if you open the start menu, and then open my computer, start menu now by itself
#closed and is no longer viable, if the screen didn't clear you would still see the start menu even if you cant interact with it
#the solution that we found was to use "\e[H\e[2J", we tried tweak it and see what happens if we replace some of it with something else
#for example we replaced the first \e with \n, and J with k or 2 with 5 or just removed parts of it
#what we found out is that half of it is controlling where we start the next console line (up to second \e)
#and the other half is in charge of clearing the screen \ terminal
#any changes to this value sort of breaks down the command, to be fair, this command feels more like a Mario (game) exploit than a proper command, if you know of an alternative, please share! :) 

#This method is used once per list
#set default quantity value to 1 by changing all values to 1
def make_quantity_list(item_list)
  index = 0
  while index <  item_list.length
    item_list[index] = 1
    index = index+1
  end
  return item_list
end

#This method is used once per list
def make_list (item_list)
  #convert user input to array
  item_list = item_list.split(' ')
  return item_list
end


def add_item (array_name, value_name)
  return array_name.push(value_name)
end

def remove_item (product, index)
  return product.delete_at(index)
end


def print_list(product, quantity) #see top Google image results for "front end vs back end comic"
  index = 0.to_i
  #only looks pretty when quantity is equal or smaller than 999999 but not smaller than -99999
  puts "# | Quantity | Product Name"
  puts "---------------------------"
  #We brake down the printing to bunch of sections: index data | spaces before value - value - spaces after value | name
  #The reason for this is the need to center the quantity in the chart while preventing chart wall distortion
  while (index <= product.length)
   spaces_after = 10.to_i- quantity[index].to_s.length #we used to_s because we don't care for numeric value but for length of said value
   spaces_before = 5.to_i-quantity[index].to_s.length  #as in, "11" is two characters, "3" is one character
    print "#{index} |"
    while(spaces_before >= 0.to_i)
      print " " 
      spaces_before = spaces_before - 1
    end
    print "#{quantity[index]}"

    #spaces_after = spaces_after - the size of spaces before - character length of the quantity 
   while ((spaces_after-(5.to_i-quantity[index].to_s.length)) >= 0.to_i)
      print " " 
      spaces_after = spaces_after -1 
    end
    print "| #{product[index]}"  
    puts ""
    puts "---------------------------"
   
    index = index + 1
  end
end

  #End of task procedure
def end_of_task (var)
  #this clears the console
  puts "\e[H\e[2J"
  #advance steps by 1, for logging \ sanity
  return (var+1)
end

  
#initiate user selection
selection = 0.to_i

#indication of software's pulse / still alive, this will be visible in most screens of the software
steps = 0.to_i


#user facing variables \ main scope
shopping_list = Array.new
shopping_list_quantity = Array.new

#main menu, shown ONCE (note the "Welcome" this part changes depending on last made operation, as well as step counter)
puts "Welcome, steps taken so far: #{steps}"
puts ""
puts "Choose an action:"
puts "--------------------------"
puts "1. Create a list"
puts "2. Add an item to the list"
puts "3. Remove an item from the list"
puts "4. Change an item's quantity"
puts "5. Print the list"
puts "To quit type anything else"
puts "enter 1-5"
selection = gets.chomp.to_i
    #this clears the console 
    puts "\e[H\e[2J"

while ((selection !=1) || (selection !=2) || (selection !=3) || (selection !=4) || (selection !=5) || (selection !=6))
  if(selection == 1)
    #Creates a list
    puts "Please enter a list of items without quantity."
    puts "Use the following format: (name other_name different_name etc)"
    puts ""
    puts "Note: You may only have one list, "
    puts "      running this twice erases the previous iteration"
    user_input = gets.chomp
    shopping_list = make_list(user_input)
    shopping_list_quantity = make_quantity_list(make_list(user_input))
    
    #returning this variable's content to the wild / releasing it (because it is going to be used elsewhere)
    user_input = (1).to_i

    #clear screen + increase logger by 1   
    steps = end_of_task(steps)

     #Menu:
     #first line is the work log, says what was done and how many actions have been taken since the start
     puts "List made, steps taken so far: #{steps}"
     puts ""
     puts "Choose an action:"
     puts "--------------------------"
     puts "1. Create a list"
     puts "2. Add an item to the list"
     puts "3. Remove an item from the list"
     puts "4. Change an item's quantity"
     puts "5. Print the list"
     puts "To quit type anything else"
     puts "enter 1-5" 
     selection = gets.chomp.to_i
     #this clears the console 
    puts "\e[H\e[2J"
    #we added the American flag as means of easily tell when one section ends and another begins, initially it was just a wall of hash tags
    #Look to the left ---> the flag is visible in the mini-map :), coloring (for background) would have even been better, but since we don't know if thats even possible in sublime we went for the flag
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO| 
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|  
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  elsif (selection == 2)
     #add items
     puts "Please type the product's name and desired quantity"
     puts "Use the following format: (name, qty: amount)"
     #this used to be just split(' ') but we changed it so the release 3 syntax would work
     #we assume accurate and valid input, but in most cases of invalid input the entire user input will find its way to product's name
     user_input = gets.chomp.split(', qty: ')
     add_item(shopping_list,user_input[0])
     add_item(shopping_list_quantity,user_input[1])
     steps = end_of_task(steps)  
         #Menu:
     #first line is the work log, says what was done and how many actions have been taken since the start
     puts "Item added, steps taken so far: #{steps}"
     puts ""
     puts "Choose an action:"
     puts "--------------------------"
     puts "1. Create a list"
     puts "2. Add an item to the list"
     puts "3. Remove an item from the list"
     puts "4. Change an item's quantity"
     puts "5. Print the list"
     puts "To quit type anything else"
     puts "enter 1-5"
     selection = gets.chomp.to_i
     #this clears the console 
    puts "\e[H\e[2J"
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  elsif (selection == 3)
    #remove
    puts "Which item's would you like to remove from the list?"
    puts "You may select an item by entering its location in the list"
    print_list(shopping_list, shopping_list_quantity)   
    user_input = gets.chomp.to_i
    
    #no input is considered as 0, any other input is unaccepted
    while ((user_input < 0.to_i) || (user_input > shopping_list_quantity.length))
      user_input = gets.chomp.to_i
    end
    
    puts "You have chosen: #{shopping_list[user_input]}"
    puts "Right now its quantity is: #{shopping_list_quantity[user_input]}"
    puts "Are you sure you want to remove it from the list? (y/n)"
    if(gets.chomp == "y")
      remove_item(shopping_list_quantity, user_input)
      remove_item(shopping_list,user_input)
      steps =  end_of_task(steps)
      #Menu:
      #first line is the work log, says what was done and how many actions have been taken since the start
      puts "Item removed, steps taken so far: #{steps}"
    else
      puts "Item wasn't removed, steps taken so far: #{steps}"
    end
      puts ""
      puts "Choose an action:"
      puts "--------------------------"
      puts "1. Create a list"
      puts "2. Add an item to the list"
      puts "3. Remove an item from the list"
      puts "4. Change an item's quantity"
      puts "5. Print the list"
      puts "To quit type anything else"
      puts "enter 1-5" 
      selection = gets.chomp.to_i
      #this clears the console 
      puts "\e[H\e[2J"
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  elsif (selection == 4)
    #change quantity
    puts "Which item's quantity would you like to change?"
    puts "You may select an item by entering its location in the list"
    print_list(shopping_list, shopping_list_quantity)   
    user_input = gets.chomp.to_i #this will also prevent negative quantity values
    while ((user_input < 0.to_i) || (user_input > shopping_list_quantity.length))
      user_input = gets.chomp.to_i
    end
    if(shopping_list[user_input] != nil)
    puts "You have chosen: #{shopping_list[user_input]}"
    puts "Right now its quantity is: #{shopping_list_quantity[user_input]}"
    puts "To what would you like to change it to?"
    shopping_list_quantity[user_input] = gets.chomp.to_i
    steps =  end_of_task(steps)
         #Menu:
    #first line is the work log, says what was done and how many actions have been taken since the start
    puts "Item quantity changed, steps taken so far: #{steps}"
    else
    puts "Error: no product found, steps taken so far: #{steps}"
    end
    puts ""
    puts "Choose an action:"  
    puts "--------------------------"
    puts "1. Create a list"
    puts "2. Add an item to the list"
    puts "3. Remove an item from the list"
    puts "4. Change an item's quantity"
    puts "5. Print the list"
    puts "To quit type anything else"
    puts "enter 1-5" 
    selection = gets.chomp.to_i
    #this clears the console 
    puts "\e[H\e[2J"
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #| * * * * * * * * *  OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  #|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
  elsif (selection == 5)
    #print 
    #empty lists can be printed, its just missing products & quantity
    steps =  end_of_task(steps)
    print_list(shopping_list, shopping_list_quantity)
    #printing area for some reason
    #the screen clearing happens before printing because user needs to be able to see the results

         #Menu:
     #first line is the work log, says what was done and how many actions have been taken since the start
     puts "List Printed, steps taken so far: #{steps}"
     puts ""
     puts "Choose an action:"
     puts "--------------------------"
     puts "1. Create a list"
     puts "2. Add an item to the list"
     puts "3. Remove an item from the list"
     puts "4. Change an item's quantity"
     puts "5. Print the list"
     puts "To quit type anything else"

     selection = gets.chomp.to_i
     #this clears the console 
    puts "\e[H\e[2J"
   else #something else was entered as a choice, as per the menu's instructions, program will exit
    #this clears the console 
    puts "\e[H\e[2J"

    #quits in a graceful way
    abort("Thanks for using the grocery list manager, have a good day!") 

  end
end

#release 5:
#Reflection:

#1.  What did you learn about pseudocode from working on this challenge?

	#Pseudo-code is for you, the programmer, and for the other programmers who may be reading the code.
	#I think at this stage, sometimes it feels like I'm overstating or redudantly pseudocoding, however
	#I do that for myself, and I use it as a learning tool.

#2.  What are the trade-offs of using arrays and hashes for this challenge?

	#Hashes gave an immediate bonus of association with key value pairs. Once one key was retrieved, so could the
	#value
	#Arrays gave the advantage of being able to dump data in the array without having to assign any data in any particula
	#order

#3.  What does a method return?

	#IF not an explicit return, an implicit return, the last line.

#4.  What kind of things can you pass into methods as arguments?

	#mothods take any object as arguments.

#5.  How can you pass information between methods?
# 	You can call another method within a method.

#6.  What concepts were solidified in this challenge, and what concepts are still confusing?
	
	#Pseudocoding is definitely not just a learning tool. It's necessary. What's still confusing is learning to understand
	#another person's thought process. As a programmer you really have to be flexible in how you approach problems because
	#theres no single way to approach a problem.
