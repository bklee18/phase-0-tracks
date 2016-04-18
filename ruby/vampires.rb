puts ""
puts "*********************************"
puts "Welcome to Vampire Test Program 1.0"
puts "How many employees will you be processing today?"
employee = gets.chomp
employee = employee.to_i

while employee < 0 
  puts "Please enter a number greater than 0."
  puts "How many employees will you be processing today?"
  employee = gets.chomp
  employee = employee.to_i
end

puts ""

employee_counter = employee 

until employee_counter == 0

  puts "What is your name?"
  name = gets.chomp
  
  puts "How old are you?"
  age = gets.chomp
  age = age.to_i
  while age <= 0
    puts "Please enter your age as a number greater than 0"
    puts "How old are you?"
    age = gets.chomp
    age = age.to_i
  end
  #Misread instructions, adding age matching year born code:
  puts "What year were you born in?"
  birth_year=gets.chomp
  #I did 2016 or 2017 in case their birthday already happened.
  if age+birth_year==(2016||2017)
    correct_age=true
  else
    correct_age=false
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
  
  puts "Please enter any allergies you have one at a time. When finished, type 'done'."
  allergy = gets.chomp
  until allergy == "done"
    if allergy == "sunshine" || allergy == "Sunshine"
      allergy = "done"
      allergy_test = false
    else
      puts "Enter your next allergy or done if finished."
      allergy = gets.chomp
    end
  end
  
  if correct_age && garlic_bread == 'y' && health_insurance == 'y' && name != "Drake Cula" && name != "Tu Fang" && allergy_test!=false
    puts "Probably not a vampire."
  elsif allergy_test == false
    puts "Probably a vampire."
  elsif correct_age==false && (garlic_bread == 'n' || health_insurance == 'n')
    puts "Probably a vampire."
  elsif correct_age==false && garlic_bread == 'n' && health_insurance == 'n'
    puts "Almost certainly a vampire."
  elsif name == "Drake Cula" || name == "Tu Fang"
    puts"Definitely a vampire."
  else
    puts "Results inconclusive."
  end
  
  puts "*********************************"
  employee_counter -= 1
end

puts "Prcoessed #{employee} employees. Vampire test processing finished!"
puts ""
puts "Actually never mind! what do these questions have to do with anything? Let's all be friends."