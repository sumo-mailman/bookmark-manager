require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/bookmark.rb'
  end

  enable :sessions, :method_override

  get '/' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/create' do
    @bookmarks
    erb :'bookmarks/create'
  end

  delete '/bookmarks/:id' do 
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  post '/bookmarks' do
    Bookmark.create(url: params[:URL], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do 
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end 

  patch '/bookmarks/:id' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    #insert SQL query with exec_params security 
    connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3",
      [ params[:url], params[:title], params[:id] ]
    )
    redirect ('/bookmarks')
  end 

  run! if app_file == $0
end

# Write a failing feature test for viewing bookmarks at the /bookmarks route.