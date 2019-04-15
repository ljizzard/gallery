require ("sinatra")
require ("sinatra/contrib/all")
require_relative("../models/exhibit.rb")
also_reload("../models/*")

get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index" )
end

get '/artists/new' do
  @artists = Artist.all
  erb(:"artists/new")
end

get '/artists/:id' do
  @artists = Artist.find(params['id'].to_i)
  erb( :"artists/show")
end

post '/artists' do
  Artist.new(params).save
  redirect to '/artists'
end
