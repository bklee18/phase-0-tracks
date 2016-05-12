=begin
Monthly Financial Budget Program:

* Establish username in DB

* Ask for positive income streams - Allow for multiple streams, as many as the user wants. Number will have to be changed to per month rate

* Ask for monthly costs - Allow for multiple costs, as many as the user wants. Number will have to be changed to per monthly rate

* Store all plusses and minuses for one month in a table that will use a foreign key to reference the month. 

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

# Now to work on getting user input and adding input into appropriate tables
def add_new_month(db)
  puts "Type the month to input income and expenses"
  month = gets.chomp
  puts "Type the year of this month"
  year = gets.chomp.to_i
  
  db.execute("INSERT INTO months (month, year) VALUES ('#{month}', #{year})")
end
# add_new_month(db)
# May 2016 is in db

# Now, need to ask user to pick which month/year to add data into. Their answer will specify the months_id that will be used to correctly add incoming income and costs to the appropirate tables.
def pick_month_id(db)  
  puts "Type the month and year to add data to (ex. 'May 2016')"
  pick_date = gets.chomp
  pick_date = pick_date.split(" ")
  month = pick_date[0]
  year = pick_date[1].to_i
  # p month
  # p year
  month_id = db.execute("SELECT months.id FROM months WHERE month = '#{month}' AND year = #{year}")
  month_id = month_id[0][0]
  return month_id
end

# Lets add some costs to the correct month_id now 
# hard-code month_id to 1 for testing purposes
def add_income(month_id, db)
  month_id = 1
  while true
    puts "Type name of income for this month, or 'done' if finished:"
    income_name = gets.chomp
    break if income_name == 'done'
    puts "Enter how much income per month this provides (will be rounded to lowest integer): "
    income_amount = gets.chomp.to_i
    db.execute("INSERT INTO income (month_id, income_name, income_amount) VALUES (#{month_id}, '#{income_name}', #{income_amount})")
  end
end
#coding 100 for month_id=1 was entered