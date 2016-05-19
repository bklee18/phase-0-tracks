# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

get '/contact' do
	"123 Brian Street<br>Briville, USA"
end

get '/great_job/' do
	"Great job, #{params[:name]}"
end

get '/:number1/add/:number2' do
	number1 = params[:number1].to_i
	number2 = params[:number2].to_i
	number_sum = number1 + number2
	number_sum.to_s
end

# Enter any part of the name, and will search students.db for matching name and return result.
get '/:name' do
	student_names = db.execute("SELECT id, name FROM students")
	id = -1
	student_names.each do |student|
		if student['name'].include?(params[:name])
			id = student['id']
		end
	end

	if id == -1
		"Name not found!"
	else
		student = db.execute("SELECT * FROM students WHERE id = #{id}")
		p student
		"ID: #{student[0]['id']} <br>Name: #{student[0]['name']} <br>Campus: #{student[0]['campus']} <br>Age: #{student[0]['age']}"
	end	
end
