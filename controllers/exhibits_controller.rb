require ("sinatra")
require ("sinatra/contrib/all")
require_relative("../models/artist.rb")
also_reload("../models/*")

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb ( :"exhibits/index" )
end

get '/exhibits/new' do
  @exhibits = Exhibit.all
  erb(:new)
end

get '/exhibits/:id' do
  @exhibits = Exhibit.find(params['id'].to_i)
  erb( :"exhibits/show" )
end

post '/exhibits' do
  Exhibit.new(params).save
  redirect to '/exhibits'
end
