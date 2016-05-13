=begin
Monthly Financial Budget Program:

* Establish username in DB

* Ask for positive income streams - Allow for multiple streams, as many as the user wants. Number will have to be changed to per month rate

* Ask for monthly costs - Allow for multiple costs, as many as the user wants. Number will have to be changed to per monthly rate

* Store all plusses and minuses for one month in a table that will use a foreign key to reference the month.

* Let user remove a cost/income, also print that all that month's costs/incomes 
* REPORTS:
** Allow user to see all income and costs for a month respectively and add them together.

=end

require 'sqlite3'
require 'faker'

# create SQLite3 db
db = SQLite3::Database.new("budget.db")

create_month_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS months(
    id INTEGER PRIMARY KEY,
    month VARCHAR(255),
    year INT
  )
SQL

create_income_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS income(
    id INTEGER PRIMARY KEY,
    month_id INT,
    income_name VARCHAR(255), 
    income_amount INT,
    FOREIGN KEY (month_id) REFERENCES months(id)
  )
SQL

create_costs_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS costs(
    id INTEGER PRIMARY KEY,
    month_id INT,
    cost_name VARCHAR(255),
    cost_amount INT,
    FOREIGN KEY (month_id) REFERENCES months(id)
  )
SQL

db.execute(create_month_table_cmd)
db.execute(create_income_table_cmd)
db.execute(create_costs_table_cmd)

# YAY tables are created

# HOW ABOUT A MONTH CLASS
# Enter a month and year to add data to...(check db to see if month year combo exists)...IF true, set @month_id to id ELSE tell user month year combo is empty and whether to proceed, then add
# maybe, maybe


# Now to work on getting user input and adding input into appropriate tables
def add_new_month(db)
  puts "Type the month to input income and expenses"
  month = gets.chomp
  puts "Type the year of this month"
  year = gets.chomp.to_i
  db.execute("INSERT INTO months (month, year) VALUES ('#{month}', #{year})")
  month_id = db.execute("SELECT id FROM months WHERE month = '#{month}' AND year = #{year}")
  month_id = month_id[0][0]
  return month_id
end


# Now, need to ask user to pick which month/year to add data into. Their answer will specify the months_id that will be used to correctly add incoming income and costs to the appropirate tables.
def pick_month_id(db)  
  puts "Type the month and year to add data to (ex. 'May 2016')"
  pick_date = gets.chomp
  pick_date = pick_date.split(" ")
  while pick_date.length != 2
    puts "Please enter month and year in format 'month year' ie 'January 2020'"
    pick_date = gets.chomp
    pick_date = pick_date.split(" ")
  end
  month = pick_date[0]
  year = pick_date[1].to_i
  month_id = db.execute("SELECT id FROM months WHERE month = '#{month}' AND year = #{year}")
  month_id = month_id[0][0]
  return month_id
end


# Method to get month/year from month_id
def get_month_year(month_id, db)
  month_year_from_db = db.execute("SELECT month, year FROM months WHERE id=#{month_id}")
  month_year = "#{month_year_from_db[0][0]} #{month_year_from_db[0][1]}"
end


# Lets add some income to the correct month_id now 
# hard-code month_id to 1 for testing purposes
def add_income(month_id, db, income_name, income_amount)
  db.execute("INSERT INTO income (month_id, income_name, income_amount) VALUES (#{month_id}, ?, ?)", [income_name, income_amount])
end


# Add costs to the correct month_id
def add_cost(month_id, db, cost_name, cost_amount)
  db.execute("INSERT INTO costs (month_id, cost_name, cost_amount) VALUES (#{month_id}, ?, ?)", [cost_name, cost_amount])
end

# remove an income
def remove_month_income(month_id, db, income_name_argument)
  db.execute("DELETE FROM income WHERE income_name = '#{income_name_argument}' AND month_id = #{month_id}")
end


# remove a cost
def remove_month_cost(month_id, db, cost_name_argument)
  db.execute("DELETE FROM costs WHERE cost_name = '#{cost_name_argument}' AND month_id = #{month_id}")
end


# Now to print all incomes for a month
def print_month_income(month_id, db)
  month_income = db.execute("SELECT income_name, income_amount FROM income WHERE month_id = #{month_id}")
  puts "All Income Entered for " + get_month_year(month_id, db)
  total = 0
  month_income.each do |month|
    puts "#{month[0]} provided income of #{month[1]}"
    total += month[1]
  end
  puts "Total Income: #{total}"
  return total
end


def print_month_cost(month_id, db)
  month_cost = db.execute("SELECT cost_name, cost_amount FROM costs WHERE month_id = #{month_id}")
  total = 0
  month_cost.each do |month|
    puts "#{month[0]} cost #{month[1]}"
    total += month[1]
  end
  puts "Total Costs: #{total}"
  return total
end


######### DRIVER CODE ##########
# month_id = 1
# while true
#   puts "Type name of income for this month, or 'done' when finished:"
#   income_name = gets.chomp
#   break if income_name == 'done'
#   puts "Enter how much income per month this provides (will be rounded to lowest integer): "
#   income_amount = gets.chomp.to_i
#   add_income(month_id, db, income_name, income_amount)
# end

# while true
#   puts "Type name of cost for this month, or 'done' when finished:"
#   cost_name = gets.chomp
#   break if cost_name == 'done'
#   puts "Enter how much this costs per month (will be rounded to lowest integer):"
#   cost_amount = gets.chomp.to_i
#   add_cost(month_id, db, cost_name, cost_amount)
# end


# User Interface

puts "\n Welcome to Brian's Monthly Budget Program \n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$ Menu $$$ \n(Enter number of choice)\n1. Add Month \n2. Access Existing Month"
user_input = gets.chomp.to_i
if user_input == 1
  month_id = add_new_month(db) 
elsif user_input == 2
  month_id = pick_month_id(db)
end

puts "\nAccessing ..." + get_month_year(month_id, db)
while true
  puts "\n*** Menu for " + get_month_year(month_id,db) + " ***\n(Enter number of choice)\n1. Add Income\n2. Add Cost\n3. Remove Income\n4. Remove Cost\n5. Print All Month Income\n6. Print All Month Cost\n7. Quit\n\n"
  user_input = gets.chomp.to_i
  if user_input == 1
    p "Enter name of income source: "
    income_name = gets.chomp.to_s
    p "Enter amount of income for month: "
    income_amount = gets.chomp.to_i
    add_income(month_id, db, income_name, income_amount)
    puts "Data entered!\n"
  elsif user_input == 2
    p "Enter name of cost: "
    cost_name = gets.chomp.to_s
    p "Enter amount of cost for month: "
    cost_amount = gets.chomp.to_i
    add_cost(month_id, db, cost_name, cost_amount)
    puts "Data entered!\n"
  elsif user_input == 3
    p "Enter name of income to remove: "
    income_name = gets.chomp.to_s
    remove_month_income(month_id, db, income_name)
    puts "Data removed!\n"
  elsif user_input == 4
    p "Enter name of cost to remove: "
    cost_name = gets.chomp.to_s
    remove_month_cost(month_id, db, cost_name)
    puts "Data removed!\n"
  elsif user_input == 5
    puts "Printing all months income: "
    print_month_income(month_id, db)
  elsif user_input == 6
    puts" Printing all months costs: "
    print_month_cost(month_id, db)
  elsif user_input == 7
    break
  end
end