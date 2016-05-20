# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources


# Release 1

get '/campuses' do
  @campuses_from_students_db = db.execute("SELECT campus FROM students")
  @campuses_from_students_db_non_repeat = []
  @campuses_from_students_db.each do |campus|
    if !@campuses_from_students_db_non_repeat.include?(campus['campus'])
      @campuses_from_students_db_non_repeat << campus['campus']
    end
  end
  
  # Now to pull campuses from campuses table instead of students table
  @campuses_from_campuses_table = db.execute("SELECT * FROM campuses")
  erb :campus
end

get '/campus/new' do
  erb :new_campus
end

post '/campuses' do
  db.execute("INSERT INTO campuses (campus) VALUES (?)", [params['name']])
  redirect '/campuses'
end