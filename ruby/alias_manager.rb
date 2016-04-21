#Take a spy's real name and create fake name by :
#1. Swapping first and last name
#2 Changing all the vowels to the next vowel and all the consonants to the next consonant in the alphabet. 
#TO DO make edge cases index values (-1 -> 0) instead of hard cases
def spy_alias full_name
  #Step #1, swap first and last name assuming input is "First_name Last_name"
  alias_name = full_name.downcase.split(' ').reverse!.join(' ').split(//)
  #Turn alias_name into an array for each letter to one index
  #Step #2, I'm plan to make two arrays, one for vowels and one for consonants. Run an iteration on vowels in string and advance on vowel array, then run iteration for consonatns
  vowels=['a','e','i','o','u']
  alias_name.map! do |letter|
    next_vowel=letter
    vowels.each_index do |index|
      if vowels[index]=='u'&&letter==vowels[index]
        next_vowel='a'
      elsif letter==vowels[index]
        next_vowel=vowels[index+1]
      end
    end
    next_vowel
  end
  
  consonants=['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
  alias_name.map! do |letter|
    next_consonant=letter
    consonants.each_index do |index|
      if consonants[index]=='z'&&letter==consonants[index]
        next_consonant='b'
      elsif letter==consonants[index]
        next_consonant=consonants[index+1]
      end
    end
    next_consonant
  end
  
  alias_name=alias_name.join('').split(' ').map! {|name| name.capitalize}.join(' ')
end

# #User Interface
# puts "\n"+"Welcome Agent".rjust(50)+"\n "
# name=nil
# alias_hash={}

# until name==""||name=="quit"
#   puts "Enter first and last name with a space in between to be aliased (EX: 'James Bond'). Press enter or type 'quit' when finished."
#   name=gets.chomp
#   if name!=(''||'quit')
#     alias_name=spy_alias name
#     alias_hash.merge!(name=>alias_name)
#   end
# end

# alias_hash.each {|name, alias_name| puts "#{name}'s aliased name is #{alias_name}"}

# John


def spy_alias1 full_name
  alphabet = {
    vowels: ['a','e','i','o','u'],
    consonants: ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
  }
  #Step #1, swap first and last name assuming input is "First_name Last_name"
  alias_name = full_name.downcase.split(' ').reverse!.join(' ').split(//)
  alias_name.map! do |letter|
    next_letter=letter
    if alphabet[:vowels].include?(letter)
      #run code to advance vowel
      index=alphabet[:vowels].index(letter)
      # p index
      #take care of edge case
      if letter==alphabet[:vowels][-1]
        next_letter=alphabet[:vowels][0]
      else
        next_letter=alphabet[:vowels][index+1]
      end
    elsif alphabet[:consonants].include?(letter)
      #run code to advance consonant
      index = alphabet[:consonants].index(letter)
      #take care of edge case
      if letter==alphabet[:consonants][-1]
        next_letter=alphabet[:consonants][0]
      else
        next_letter=alphabet[:consonants][index+1]
      end
    end
    next_letter
  end
  alias_name=alias_name.join('').split(' ').map! {|name| name.capitalize}.join(' ')
end
# Compare each letter of a word to a letters hash 
# See if it belongs to the vowels array or the consonants array
# Whichever one it belongs to find the index where it lives in the array

# User Interface
puts "\n"+"Welcome Agent".rjust(50)+"\n "
name=nil
alias_hash={}

until name=="" || name== "quit"
  puts "Enter first and last name with a space in between to be aliased (EX: 'James Bond'). Press enter or type 'quit' when finished."
  name=gets.chomp
  unless name=='quit'|| name==''
    alias_name=spy_alias1 name
    alias_hash.merge!(name=>alias_name)
  end
end

alias_hash.each {|name, alias_name| puts "#{name}'s aliased name is #{alias_name}"}