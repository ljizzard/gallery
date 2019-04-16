require ("sinatra")
require ("sinatra/contrib/all")
require_relative("../models/exhibit.rb")
also_reload("../models/*")

# this route will show all the artists
get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index" )
end

# this route shows a form to create a new artist
get '/artists/new' do
  @artists = Artist.all
  erb(:"artists/new")
end

# TODO: this route should show a single artist
get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb( :"artists/show")
end

# this route is called when we press delete on an artist
post '/artists/:id/delete' do
 @artist = Artist.find( params['id'] )
 @artist.delete()
 redirect to '/artists'
end

# this route is called when we submit a new artist using the new form
post '/artists' do
  Artist.new(params).save
  redirect to '/artists'
end
