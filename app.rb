require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/words')
require('./lib/definitions')
also_reload('lib/**/*.rb')

get('/') do
  @words = Words.all
  erb(:words)
end

get('/words') do
  @words = Words.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Words.find(params[:id].to_i)
  erb(:word)
end

get('/words/:id/edit') do
  @word = Words.find(params[:id].to_i)
  erb(:edit_word)
end

post('/words') do
  spelling = params[:spelling]
  word = Words.new(spelling)
  word.save
  @words = Words.all
  erb(:words)
end

patch('/words/:id') do
  @word = Words.find(params[:id].to_i)
  @word.update(params[:spelling])
  @words = Words.all
  erb(:words)
end

delete('/words/:id') do
  @word = Words.find(params[:id].to_i)
  @word.delete
  @words = Words.all
  erb(:words)
end

get('/search_word') do
  @words = Words.all
  erb(:words)
end

post('/query_word') do
  # "Hello world"
  @words = Words.search(params[:spelling])
  binding.pry
  erb(:search_word)
end

post('/words/:id/definitions') do
  @word = Words.find(params[:id].to_i())
  definition = Definitions.new(params[:definition], @word.id)
  definition.save
  binding.pry
  erb(:word)
end

get('/words/:id/definitions/:definition_id') do
  @word = Words.find(params[:id].to_i())
  @definition = Definitions.find(params[:definition_id].to_i())
  binding.pry
  erb(:definitions)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Words.find(params[:id].to_i())
  definition = Definitions.find(params[:definition_id].to_i())
  definition.update(params[:text], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definitions.find(params[:definition_id].to_i())
  definition.delete
  @word = Words.find(params[:id].to_i())
  erb(:word)
end