# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".<???>
# => “InVeStIgAtIoN”.swapcase
p "InVeStIgAtIoN".swapcase

# "zom".<???>
# => “zoom”
p "zom".insert(1, 'o')

# "enhance".<???>
# => "    enhance    "
p "enhance".center(15)

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"
p "Stop! You’re under arrest!".upcase

# "the usual".<???>
#=> "the usual suspects"
p "the usual"<<" suspects"

# " suspects".<???>
# => "the usual suspects"
p "suspects".prepend"the usual "

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"
p "The case of the disappearing last letter".chop

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"
p "The mystery of the missing first letter".slice(1..-1)

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"
p "Elementary,    my   dear        Watson!".squeeze

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
p "z".ord

# "How many times does the letter 'a' appear in this string?".<???>
# => 4
p "How many times does the letter 'a' appear in this string?".count('a')