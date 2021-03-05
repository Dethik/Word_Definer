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

get('words/:id/edit') do
  @word = Words.find(params[:id].to_i)
  erb(:edit_word)
end

