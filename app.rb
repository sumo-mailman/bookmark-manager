require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/bookmark.rb'
  end

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

  post '/bookmarks/create' do
    Bookmark.create(params[:URL])

  end 


  run! if app_file == $0
end

# Write a failing feature test for viewing bookmarks at the /bookmarks route.