puts 'What is the hamster\'s name?'
name = gets.chomp

puts "What is #{name}'s volume level? (1-10)"
volume = gets.chomp
volume = volume.to_i
until 0 < volume && volume < 11
  if volume < 1 || volume > 10
    puts "Please enter a value 1-10. What is #{name}'s volume level?"
    volume = gets.chomp
    volume = volume.to_i
  end
end

puts "What is #{name}'s fur color?"
fur = gets.chomp

puts "Is #{name} a good candidate for adoption? (y/n)"
adoption = gets.chomp
until adoption == 'y' || adoption == 'n'
  if adoption != 'y' || adoption != 'n'
    puts "Please answer with 'y' or 'n'. Is #{name} a good candidate for adoption? (y/n)"
    adoption=gets.chomp
  end
end

puts "Name: " + name
puts "Volume level: " + volume.to_s
puts "Fur color: " + fur
puts "Is it good for adoption? " + adoption