#Take a spy's real name and create fake name by :
#1. Swapping first and last name
#2 Changing all the vowels to the next vowel and all the consonants to the next consonant in the alphabet. 

def spy_alias full_name
  #Step #1, swap first and last name assuming input is "First_name Last_name"
  
  alias_name = full_name.downcase.split(' ')
  alias_name.reverse!
  alias_name=alias_name.join(' ')
  alias_name=alias_name.split(//)
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
      if letter==consonants[index]
        next_consonant=consonants[index+1]
      elsif consonants[index]=='z'&&letter==consonants[index]
        next_consonant='b'
      end
    end
    next_consonant
  end
  alias_name.join('')
end

