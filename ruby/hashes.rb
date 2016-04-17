#Goal: code a program that will take user input and store it in a hash questionnaire of interior designer questions. Allow the user to select any field to re-edit after displaying hash values
#Psuedocode:
#Define a method and set each hask-key value with each question asked.
#store each answer into appropriate hask key-value pair.
#After asking all questions, print all user inputted data on screen, then prompt user if they need to re-edit any of their answers.
#If user does need to re-edit answer, have them enter in key value and match that string with hash key. Have answer overwrite appropriate key-value pair.
#end method. Put in user interface on bottom to begin method.

def interior_designer
  interior_design_questionnaire = {}
  puts "Enter Name: "
  interior_design_questionnaire[:name]=gets.chomp
  
  puts "Enter City: "
  interior_design_questionnaire[:city]=gets.chomp
  
  puts "Enter Number of Rooms: "
  interior_design_questionnaire[:rooms]=gets.chomp
  
  puts "Do you have kids? (y/n)"
  if gets.chomp!=("y"||"n")
    puts "Please enter in 'y' or 'n'"
    puts "Do you have kids? (y/n)"
  end
  if gets.chomp=="y"
      interior_design_questionnaire[:kids]=true
  elsif gets.chomp=="n"
      interior_design_questionnaire[:kids]=false
  end
  
  puts "Enter your age: "
  interior_design_questionnaire[:age]=gets.chomp.to_i
  
  puts "Preferred Decor Theme: "
  interior_design_questionnaire[:decor]=gets.chomp
  
  puts "Favorite Color:"
  interior_design_questionnaire[:fave_color]=gets.chomp
  
  p interior_design_questionnaire
  
end

interior_designer