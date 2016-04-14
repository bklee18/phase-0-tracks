# Create method that advances every letter of a string one letter forward.
# e.g. "abc" becomes "bcd"
# spaces should remain a space character

# We need a user entered string.
# Take that string, and advance each letter forward by one, spaces should remain spaces.
# Do not use .each or .map

# puts "Please enter password to encrypt."
# password = gets.chomp

def encrypt(input)
 index = 0
 while index < input.length
     if input[index] == "z"
         input[index] = "a"
           index += 1
     elsif input[index] == " "
         index += 1
     else
     input[index] = input[index].next
     index += 1
 end
 end
input
end
# puts encrypt(password)


# We need a user entered string.
# Take that string, retract each letter by one, spaces should remain spaces. e.g. a -> z, d -> c.
# Incorporate indexes, start at 0.


# puts "Please enter a password to decrypt."
# password2 = gets.chomp

def decrypt(input)
  array="abcdefghijklmnopqrstuvwxyz"
  index = 0
  while index<input.length
    if input[index]==" "
      index+=1
    else
      letter=input[index]
      position = array.index(letter)
      input[index] = array[position-1]
      index+=1
    end
  end
  input
end

# puts "Result: " + decrypt(password2)

# Ask agent to decrypt or encrypt password
# Take choice and match to either decrypt or encrypt method
# Then ask and store password input, and then apply desired method

puts "Welcome agent!"
puts "Would you like to encrypt or decrypt a password?(encrypt/decrypt)"
choice = gets.chomp

until choice=="encrypt"||choice=="decrypt"
  puts "Incorrect answer choice"
  puts "Would you like to encrypt or decrypt a password?(encrypt/decrypt)"
  choice = gets.chomp
end
puts "Please enter password."
password = gets.chomp

if choice == "encrypt"
  puts "Result: #{encrypt(password)}"
elsif choice == "decrypt"
  puts "Result: #{decrypt(password)}"
end   