require ("sinatra")
require ("sinatra/contrib/all")
require_relative("../models/artist.rb")
also_reload("../models/*")

 # this route will show all the exhibits
get '/exhibits' do
  @exhibits = Exhibit.all()
  erb ( :"exhibits/index" )
end

# this route shows a form to create a new exhibit
get '/exhibits/new' do
  @exhibits = Exhibit.all
  erb(:"exhibits/new")
end

# # TODO: this route should show a single exhibit
get '/exhibits/:id' do
  @exhibits = Exhibit.find(params['id'].to_i)
  erb( :"exhibits/show" )
end

# TODO: this should call a form to update an existing exhbit
get '/exhibits/:id/update' do
  @exhibits = Exhibit.find(params['id'])
  erb(:"exhibits/edit")
end


post '/exhibits/:id/update' do
  @exhibit = Exhibit.new(params)
  @exhibit.update()
  redirect to "/exhibits"
end

# This route is called when we select delete on a exhibit
post '/exhibits/:id/delete' do
  @exhibit = Exhibit.find (params['id'])
  @exhibit.delete()
  redirect to '/exhibits'
end


post '/exhibits' do
  Exhibit.new(params).save
  redirect to '/exhibits'
end
