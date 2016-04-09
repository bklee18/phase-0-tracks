#Questions for testing for vampires

puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp
age = age.to_i
while age <= 0
  puts "Please enter your age as number greater than 0"
  puts "How old are you?"
  age = gets.chomp
  age = age.to_i
end

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic_bread = gets.chomp
until garlic_bread == "y" || garlic_bread == "n"
  puts "Please enter y or n for your answer."
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
  garlic_bread = gets.chomp
end

puts "Would you like to enroll in our company's health insurance plan? (y/n)"
health_insurance = gets.chomp
until health_insurance == 'y' || health_insurance == 'n'
  puts "Please enter y or n for your answer."
  puts "Would you like to enroll in our company's health insurance plan? (y/n)"
  health_insurance = gets.chomp
end
