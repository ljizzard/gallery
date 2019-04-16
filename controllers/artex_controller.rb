require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/artex.rb')
require_relative( '../models/artist.rb' )
require_relative( '../models/exhibit.rb' )
also_reload( '../models/*' )

get '/artex' do
  @artex = Artex.all()
  erb ( :"artex/index" )
end


get '/artex/new' do
  @artex = Artex.all
  erb(:"artex/new")
end

post '/artex' do
  artex = Artex.new(params)
  artex.save
  redirect to("/artex")
end
