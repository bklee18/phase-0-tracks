# get user input and length of input
# set a loop to go through all the letters in the string
# display letters



def encrypt(string) #encryption method
index = 0 #initializes the loop to go through letters in the string 
while index < string.length #sets the condition of the loop
     if string[index] == "z"
         string[index] = "a"
           index += 1
     elsif string[index] == ""
         index += 1
     else
     string[index] = string[index].next
     index += 1
 end
 end
string #loop ends when method gets to the last letter in the string
end


# get the user to input a string
# set an array for the method to work with
# initialize a loop to go through the index and move back in the position
# of the array 

def decrypt(string)
  array="abcdefghijklmnopqrstuvwxyz" 
  index = 0
  while index < string.length
    if string[index] == ""
      index += 1
    else
      letter = string[index]
      position = array.index (letter)
      string [index] = array[position-1]
      index+=1
    end
  end
  string
end


puts "Do you want to encrypt or decrypt a word?(encrypt/decrypt)"
option = gets.chomp

puts "Please type in word"
word = gets.chomp

if option == "encrypt"
  puts "#{encrypt(word)}"
elsif option == "decrypt"
  puts "#{decrypt(word)}"
end   