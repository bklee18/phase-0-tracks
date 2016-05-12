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

create_incoming_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS incoming(
    id INTEGER PRIMARY KEY,
    month_id INT,
    income INT
  )
SQL

create_costs_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS costs(
    id INTEGER PRIMARY KEY,
    month_id INT,
    cost INT
  )
SQL

db.execute(create_month_table_cmd)
db.execute(create_incoming_table_cmd)
db.execute(create_costs_table_cmd)

# YAY tables are created

# Now to work on getting user input and adding input into appropriate tables
puts "Type the month to input income and expenses"
month = gets.chomp
puts "Type the year of this month"
year = gets.chomp.to_i

db.execute("INSERT INTO months (month, year) VALUES ('#{month}', #{year})")




