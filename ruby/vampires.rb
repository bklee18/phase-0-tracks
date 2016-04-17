puts "How many employees will be processed?"
employees = gets.chomp
employees = employees.to_i

while employees > 0

puts "What is your name?"
name = gets.chomp
puts "How old are you?"
age = gets.chomp
puts "What year wear you born?"
birthyear = gets.chomp
puts "Should we order garlic bread from the cafeteria? (y/n)"
order = gets.chomp
puts "Would you like to enroll in the company's health insurance? (y/n)"
insurance = gets.chomp

if age.to_i + birthyear.to_i == 2016 && order == "y" || insurance == "y"
	puts "Probably not a vampire"

elsif age.to_i + birthyear.to_i != 2016 && order == "n" && insurance == "n"
	puts "Almost certainly a vampire"

elsif age.to_i + birthyear.to_i != 2016 && order == "n" || insurance == "n"
	puts "Probably a vampire"

elsif name == "Drake Cula" || "Tu Fang"
	puts "Definitely a vampire"
else
	puts "Results inconclusive"
end


allergy_test = "done"
allergy = ""

	while allergy != allergy_test
	puts "Please list your allergies one at a time. Type done when finished"
	allergy = gets.chomp
	if allergy == "sunshine"
      allergy = "done"
	end
end

employees -= 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."