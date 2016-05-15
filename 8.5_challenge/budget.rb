=begin
Monthly Financial Budget Program:

* Budget program to enter incomes and expenses for a month. User can enter multiple months.

* I create 3 tables, months, income, costs. The months table has a one-to-many relationship with income and costs where the month_id is a foreign key in income and costs.

* Then add print functionality to print total income and total cost for a month. 

* REPORTS (not implemented yet):
** Allow user to see all income and costs for a month respectively and add them together.
** Allow user to see cash flow over several months.
** Allow user to enter a recurring income/cost
** Allow multiple users by making a user table that will have a one-to-many relationship with months table.

=end

require 'sqlite3'

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


def add_new_month(db)
  puts "Type the month and year to add data to (ex. 'May 2016')"
  new_month = gets.chomp
  new_month = new_month.split(" ")
  while new_month.length != 2
    puts "Please enter month and year in format 'month year' ie 'January 2020'"
    new_month = gets.chomp
    new_month = new_month.split(" ")
  end
  db.execute("INSERT INTO months (month, year) VALUES ('#{new_month[0]}', #{new_month[1]})")
  month_id = db.execute("SELECT id FROM months WHERE month = '#{new_month[0]}' AND year = #{new_month[1]}")
  month_id = month_id[0][0]
  return month_id
end


def remove_month(db)
  print_month_table(db)
  puts "Enter the id of the month you wish to remove: "
  month_id_to_remove = gets.chomp.to_i
  puts "Deleting..."
  db.execute("DELETE FROM months WHERE id = #{month_id_to_remove}")
end


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


def get_month_year(month_id, db)
  month_year_from_db = db.execute("SELECT month, year FROM months WHERE id=#{month_id}")
  month_year = "#{month_year_from_db[0][0]} #{month_year_from_db[0][1]}"
end


def add_income(month_id, db)
  puts "Enter name of income source: "
    income_name = gets.chomp.to_s
  puts "Enter amount of income for month: "
    income_amount = gets.chomp.to_i
  db.execute("INSERT INTO income (month_id, income_name, income_amount) VALUES (#{month_id}, ?, ?)", [income_name, income_amount])
  puts "Data entered!\n"
end


def add_cost(month_id, db)
  puts "Enter name of cost: "
  cost_name = gets.chomp.to_s
  puts "Enter amount of cost for month: "
  cost_amount = gets.chomp.to_i
  db.execute("INSERT INTO costs (month_id, cost_name, cost_amount) VALUES (#{month_id}, ?, ?)", [cost_name, cost_amount])
  puts "Data entered!\n"
end


def remove_month_income(month_id, db, income_name)
  puts "Enter name of income to remove: "
  income_name = gets.chomp.to_s
  db.execute("DELETE FROM income WHERE income_name = '#{income_name}' AND month_id = #{month_id}")
  puts "Data removed!\n"
end


def remove_month_cost(month_id, db)
  puts "Enter name of cost to remove: "
  cost_name = gets.chomp.to_s
  db.execute("DELETE FROM costs WHERE cost_name = '#{cost_name}' AND month_id = #{month_id}")
  puts "Data removed!\n"
end


def print_month_table(db)
  month_table = db.execute("SELECT * FROM months")
  month_table.each do |month|
    puts "id = #{month[0]} ||#{month[1]} #{month[2]}"
  end
end


def print_month_income(month_id, db)
  month_income = db.execute("SELECT income_name, income_amount FROM income WHERE month_id = #{month_id}")
  puts "All Income Entered for " + get_month_year(month_id, db)
  total = 0
  counter = 1
  month_income.each do |month|
    puts "#{counter}. #{month[0]} - $#{month[1]}"
    total += month[1]
    counter += 1
  end
  puts "----------------------\nTotal Income: $#{total}"
  return total
end


def print_month_cost(month_id, db)
  month_cost = db.execute("SELECT cost_name, cost_amount FROM costs WHERE month_id = #{month_id}")
  total = 0
  counter = 1
  month_cost.each do |month|
    puts "#{counter}. #{month[0]} - $#{month[1]}"
    total += month[1]
    counter += 1
  end
  puts "----------------------\nTotal Costs: $#{total}"
  return total
end



# User Interface

puts "\n Welcome to Brian's Monthly Budget Program \n********************************\n"
def ui_rootmenu(db)
  while true
    puts "$$$ Menu $$$".ljust(50) + "\n(Enter number of choice)\n1. Add Month \n2. Access Existing Month\n3. Remove Existing Month \n4. See List of Existing Months\n5. Exit"
    user_input = gets.chomp.to_i
    if user_input == 1
      month_id = add_new_month(db)
    elsif user_input == 2
      month_id = pick_month_id(db)
      ui_submenu(month_id, db)
    elsif user_input == 3
      remove_month(db)
    elsif user_input == 4
      print_month_table(db)
    elsif user_input == 5
      break
    end
    puts "Press enter to continue..."
    gets
  end
  puts "Are you sure you want to exit? (y/n)"
  user_input = gets.chomp
  ui_rootmenu(db) if user_input == 'n'
  puts "Goodbye!"
end

def ui_submenu(month_id, db)
  puts "\nAccessing ..." + get_month_year(month_id, db)
  while true
    puts "\n*** Menu for " + get_month_year(month_id,db) + " ***\n(Enter number of choice)\n1. Add Income\n2. Add Cost\n3. Remove Income\n4. Remove Cost\n5. Print All Month Income\n6. Print All Month Cost\n7. Return to Root Menu\n\n"
    user_input = gets.chomp.to_i
    puts
    if user_input == 1
      add_income(month_id, db)
    elsif user_input == 2
      add_cost(month_id, db)
    elsif user_input == 3
      remove_month_income(month_id, db)
    elsif user_input == 4
      remove_month_cost(month_id, db)
    elsif user_input == 5
      puts "Printing all months income: "
      print_month_income(month_id, db)
    elsif user_input == 6
      puts" Printing all months costs: "
      print_month_cost(month_id, db)
    elsif user_input == 7
      break
    end
    puts "\nPress Enter to continue..."
    gets
  end
end

ui_rootmenu(db)