require 'sinatra'
require 'sinatra/json'
require 'http'
require 'erb'

todos = [
  {
    id: 1,
    name: "walk the dog",
    date: "12/04",
    done: false
  },
  {
    id: 2,
    name: "do the washing",
    date: "14/04",
    done: false
  }
]

get '/todos' do 
  return json(todos)
end 

post '/add_todo' do 
  # todo = JSON.parse(request.body.read)
  # todos << todo 
  # return json(todo)
  data = request.body.read
  p JSON.parse(data)
  return "hello"
end

get '/todo/:id' do
  id = params[:id].to_i
  found_todo = todos.find do |todo|
    todo[:id] == id
  end 
  return json(found_todo)
end 

get '/running' do 
  get_data = HTTP.auth("Bearer 51c32d75594a65eb55fd740786d22a134aea407c").get("https://www.strava.com/api/v3/athlete").to_s
  @running_data = JSON.parse(get_data)
  p @running_data
  # erb :running
  return 'hello'
end 

