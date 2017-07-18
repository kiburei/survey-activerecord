require "bundler/setup"
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload('lib/**/*.rb')



get('/') do
  @questions = Survey.all
  erb(:index)
end

post('/questions') do
  question = params.fetch('question')
  question = Survey.new(question: question)
  question.save
  @questions = Survey.all
  erb(:index)
end

get('/questions/:id') do
  id = params.fetch("id")
  @question = Survey.find(id)
  @answers = Answer.all
  erb(:question)
end

post '/questions/answers' do
  answer = params.fetch('answer')
  question = Survey.find(params.fetch('id').to_i)
  @answer = Answer.new(answer: answer, survey_id: question.id)
  @answer.save
  @question = Survey.find(question.id)
  erb(:question)
end
