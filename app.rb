require("sinatra/activerecord")
require('sinatra')
require('sinatra/reloader')
require('./lib/topic')
also_reload('lib/**/*.rb')
require("pg")

get('/') do
  erb(:index)
end

post('/topics') do
  topic = params.fetch('topic')
  topic = Topic.new(name: => topic)
end
