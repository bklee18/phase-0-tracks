# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # create and empty hash
  # ask for input from the user
  # convert the input into an array .SPLIT
  # convert the elements into symbols .TO_SYM
  # push symbols into hash
  # set default quantity .EACH assign quantity 0
  # print the list to the console [can you use one of your other methods here?]
  # output: pretty grocery hash

# Method to add an item to a list
# input: item name and optional quantity
# steps: ask user for input
        #IF yes
        # prompt for the string
        # prompt for quantity
        # convert .TO_SYM
        # push to hash
# output: updated hash

# Method to remove an item from the list
# input: item name and optional quantity
# steps: #IF yes
         # prompt for item
         # covert TO_SYM
         # .HAS_KEY? to find whether the item is in there
         # .DELETE
# output: updated hash

# Method to update the quantity of an item
# input: new quantity
# steps: prompt for item and quantity
         # covert TO_SYM
         # .HAS_KEY? to find whether the item is in there
         # IF item is found update quantity
         # ELSE print error
# output: updated quantity

# Method to print a list and make it look pretty
# input: hash
# steps: iterate through the hash .EACH
         # puts Item: key and Qty: quantity
# output: shopping list


def create_list(items)
  shopping_list = {}
  each_item = items.split(' ')
  each_item.each do |thing|
    shopping_list[thing] = 0
  end
  shopping_list   
end

# grocery_list=create_list("butter soap")

def add_item(grocery_hash)
  puts "What would you like to add and how many?"
  input = gets.chomp.split(' ')
  grocery_hash[input[0]] = input[1].to_i
  p grocery_hash
end

# grocery_list = add_item(grocery_list)
  
def remove_item(grocery_list)
  puts "What would you like to remove from the list?"
  input = gets.chomp
  if grocery_list.has_key?(input)
    grocery_list.delete(input)
  else
    puts "Item not on list"
  end
  p grocery_list
end  
  
# grocery_list = remove_item(grocery_list) 

def update_qty(hash)
  puts "Which item and how many?"
  input = gets.chomp.split(' ')
  if hash.has_key?(input[0])
    hash[input[0]] = input[1]
  else 
    puts "Item not found"
  end
  hash
end


def print_list(hash)
  hash.each do |item, qty|
    puts "Item: #{item} Qty: #{qty}"
  end
end
  
puts "Grocery List Program"
puts "Enter list of items, separated by space:"
items=gets.chomp
grocery_list = create_list(items)
print_list(grocery_list)
puts "Would you like to add an item? (y/n)"
answer = gets.chomp
if answer == 'y'
  add_item(grocery_list)
end
puts "\n Would you like to remove an item? (y/n)"
answer = gets.chomp
if answer == 'y'
  remove_item(grocery_list)
end
choice = String.new
until choice=='n'
  puts "Would you like to update the quantity of an item? (y/n)"
  choice = gets.chomp
  if choice == 'y'
    update_qty(grocery_list)
  end
end
puts
print_list(grocery_list)

#Release 4: we could call on the add_item inside the create_list so that the user wouldn't have to update quantity on all the items.

#Release 5: Reflect
# 1. I learned that spending some more time on pseudocode can go a long way in keeping a coding session, whether it's pairing or alone, on track.
# Good, specific pseudocode is like a good framework or foundation to build a house.
# 2. We used a hash, and passed that hash into each of the methods. I think that way really cut down on code compared to if we did 2 arrays. 
# 3. A method returns the its last expression, or an explicit return command.
# 4. A method can be designed to take in any kind of data structure, singular (string, int, etc) or list (hash, array).
# 5. We were able to pass a hash between methods by assigning the creation of that hash to an a variable external to the methods, then passing that
# hash into each method and that method would return the updated hash.
# 6. Using hashes, being able to add string values as keys to a hash were definitely reinforced for me. Previously, I had only passed key values into 
# a hash using symbols, so learning how to better take advantage of the flexibility of hashes and their keys is a great tool for me going forward.
