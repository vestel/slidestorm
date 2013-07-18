require "sinatra"
require "sinatra/activerecord"

require './models.rb'

get '/' do
#    @sitelist = Site.all #({active: true})
    erb :index 
end

get '/active.json' do
    @sitelist = Site.find_all_by_active("t")
    @sitelist.to_json
end


get '/list' do
    @sitelist = Site.all
    erb :list
end

post '/add' do
    Site.create({label: params[:label], url: params[:url], active: params[:active]})
    erb :save
end

post '/edit/:id' do
    @params = params
    site = Site.find(params[:id])
    site.active = true if params[:active]
    site.active = false unless params[:active]
    site.label = params[:label]
    site.url = params[:url]
    site.save!
    erb :save
end

delete '/delete/:id' do
    "Deleted!"
end
