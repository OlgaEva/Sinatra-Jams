require './config/environment'
require 'sinatra'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @artist = Artist.all
    erb :welcome
  end

  get "/new" do
    erb :new
  end

  post "/" do
    @artist = Artist.create(params[:artist])
    redirect to "/#{@artist.id}"
  end

  get "/:id" do
    @artist = Artist.find(params[:id])
    erb :show
  end
end
