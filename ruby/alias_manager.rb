#Take a spy's real name and create fake name by :
#1. Swapping first and last name
#2 Changing all the vowels to the next vowel and all the consonants to the next consonant in the alphabet. 

#Define a method that takes a full name with input of format "'First name' 'Last name'"
# =>Transform the string name into reverse, then into an array where each letter is at each index.
# =>Create a vowels array
# =>Do a MAP! loop on the name array
# =>  Then loop through the vowels array and replace with the appropriate next vowel. Also take care of edge case.
# =>Create a consonatns array
# =>Do a MAP! loop on the name array
# =>  Then loop through the consonants array and replace with the appropriate next consonant. Also take care of edge case.
# =>Name array should now be aliased, transfrom back into a string input to be returned.

def spy_alias full_name
  alias_name = full_name.downcase.split(' ').reverse!.join(' ').split(//)
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

#################################################################################
#2nd approach
# Compare each letter of a word to a letters hash 
# See if it belongs to the vowels array or the consonants array
# Whichever one it belongs to find the index where it lives in the array
def spy_alias2 full_name
  alphabet = {
    vowels: ['a','e','i','o','u'],
    consonants: ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
  }
  alias_name = full_name.downcase.split(' ').reverse!.join(' ').split(//)
  alias_name.map! do |letter|
    next_letter=letter
    if alphabet[:vowels].include?(letter)
      index=alphabet[:vowels].index(letter)
      if letter==alphabet[:vowels][-1]
        next_letter=alphabet[:vowels][0]
      else
        next_letter=alphabet[:vowels][index+1]
      end
    elsif alphabet[:consonants].include?(letter)
      index = alphabet[:consonants].index(letter)
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

# puts "\n"+"Welcome Agent".rjust(50)+"\n "
# name=nil
# alias_hash={}
# until name=="" || name== "quit"
#   puts "Enter first and last name with a space in between to be aliased (EX: 'James Bond'). Press enter or type 'quit' when finished."
#   name=gets.chomp
#   unless name=='quit'|| name==''
#     alias_name=spy_alias2 name
#     alias_hash.merge!(name=>alias_name)
#   end
# end
# alias_hash.each {|name, alias_name| puts "#{name}'s aliased name is #{alias_name}"}


#################################################################################
#3rd approach
#Define a method for advancing letter
# =>IF letter is a vowel, advance to next vowel
# =>ELSE letter is a consonant and advance to next consonant
#Define an alias method.
# =>Transform a string input into a reversed array
# =>Loop through the array and apply the appropriate method to advance.
# =>Transform name back to string input and return

def advance_letter letter
  vowel='aeiou'
  consonant='bcdfghjklmnpqrsvwxyz'
  if vowel.include?(letter)
    if letter==vowel[-1]
      letter=vowel[0]
    else
      letter=vowel[vowel.index(letter)+1]
    end
  elsif consonant.include?(letter)
    if letter==consonant[-1]
      letter=consonant[0]
    else
      letter=consonant[consonant.index(letter)+1]
    end
  end
  letter
end

def spy_alias3 full_name
  alias_name = full_name.downcase.split(' ').reverse!.join(' ').split(//)
  alias_name.map! {|letter| advance_letter letter}
  alias_name=alias_name.join('').split(' ').map! {|name| name.capitalize}.join(' ')
end

puts "\n"+"Welcome Agent".rjust(50)+"\n "
name=nil
alias_hash={}
until name=="" || name== "quit"
  puts "Enter first and last name with a space in between to be aliased (EX: 'James Bond'). Press enter or type 'quit' when finished."
  name=gets.chomp
  unless name=='quit'|| name==''
    alias_name=spy_alias3 name
    alias_hash.merge!(name=>alias_name)
  end
end
alias_hash.each {|name, alias_name| puts "#{name}'s aliased name is #{alias_name}"}